require 'active_support'
require 'active_support/core_ext'
require 'config'
require 'yaml'
require 'pry'

require_relative '../classes/class_generator'
require_relative '../classes/original_node_class_generators/patterned_object/class_generator'
require_relative '../classes/original_node_class_generators/cherry_object/class_generator'
require_relative '../classes/module_generator'
require_relative '../initializers/simple_swagger_docs/eruby'

namespace :openapi_object_class do
  desc "Generate Openapi Object All Class"
  task :generate_all_class, [:version] do |task, args|
    version = args[:version]
    
    load_and_set_settings(version)
    schema_paths = File.expand_path "generators/schema/#{version}/**/*.yaml", root

    SchemaInfo = Struct.new(:object_name, :relative_filepath, :relative_dirdepth, :version)

    Dir.glob(schema_paths).each do |path|
      schema_object_name       = File.basename(path, ".yaml")
      schema_relative_dirdepth = File.dirname(path).split('/').size - schema_root_dirdepth(version)
      schema_relative_filepath = Pathname(path).relative_path_from(schema_root_dirname(version)).to_s

      schema_info = SchemaInfo.new(schema_object_name, schema_relative_filepath, schema_relative_dirdepth, version)

      if schema_object_name == 'openapi_object'
        Rake::Task["openapi_object_class:generate_root_class"].invoke(schema_info)
        Rake::Task["openapi_object_class:generate_root_class"].reenable
      elsif schema_object_name == 'swagger_object'
        Rake::Task["openapi_object_class:generate_root_class"].invoke(schema_info)
        Rake::Task["openapi_object_class:generate_root_class"].reenable
      elsif schema_object_name.end_with?('patterned_object')
        Rake::Task["openapi_object_class:generate_patterned_patterned_node_class"].invoke(schema_info)
        Rake::Task["openapi_object_class:generate_patterned_patterned_node_class"].reenable
      elsif schema_object_name.end_with?('cherry_object')
        Rake::Task["openapi_object_class:generate_cherry_node_class"].invoke(schema_info)
        Rake::Task["openapi_object_class:generate_cherry_node_class"].reenable
      elsif schema_object_name.end_with?('property')
        # It is generated in the create_schema_object_class.
      elsif schema_object_name.end_with?('_object')
        Rake::Task["openapi_object_class:generate_node_class"].invoke(schema_info)
        Rake::Task["openapi_object_class:generate_node_class"].reenable
      end
    end
  end

  private

  desc "Generate Openapi Object [Schema Name] Class"
  task :generate_node_class, [:schema_info] do |_, args|
    schema_info = args[:schema_info]
    create_schema_object_class(schema_info, 'openapi_object_node_class_template')
  end

  desc "Generate Openapi Object Root Class"
  task :generate_root_class, [:schema_info] do |_, args|
    schema_info = args[:schema_info]
    create_schema_object_class(schema_info, 'openapi_object_root_class_template')
  end

  desc "Generate Variable Oject [Schema Name] Class"
  task :generate_patterned_patterned_node_class, [:schema_info] do |_, args|
    schema_info = args[:schema_info]
    create_patterned_object_class(schema_info, 'patterned_object_node_class_template')
  end

  desc "Generate Cherry Object [Schema Name] Class"
  task :generate_cherry_node_class, [:schema_info] do |_, args|
    schema_info = args[:schema_info]
    create_cherry_object_class(schema_info, 'cherry_object_node_class_template')
  end

  def load_and_set_settings(version)
    schema_path = File.expand_path "generators/schema/#{version}/**/*.yaml", root
    schema_paths = Dir.glob(schema_path)
    Config.load_and_set_settings(schema_paths)
  end

  def create_schema_object_class(schema_info, template_name)
    template_path = File.expand_path "generators/templates/class_generators/#{template_name}.rb.erb", root
    eruby         = SimpleSwaggerDocs::Eruby.new(File.read(template_path))
    output_path   = File.expand_path "#{version_relative_path(schema_info.version)}/schema/generated/#{schema_object_name_with_dirname(schema_info)}.rb"

    generator     = OpenapiObject::ClassGenerator.new(schema_info)
    
    create_directory(output_path)
    File.write output_path, eruby.result(generator: generator)

    generator.module_includers.each do |module_includer|
      create_openapi_object_property_module(generator, module_includer, 'openapi_object_node_module_template')
    end
  end

  def create_patterned_object_class(schema_info, template_name)
    template_path = File.expand_path "generators/templates/class_generators/#{template_name}.rb.erb", root
    eruby         = SimpleSwaggerDocs::Eruby.new(File.read(template_path))
    output_path   = File.expand_path "#{version_relative_path(schema_info.version)}/schema/generated/#{schema_object_name_with_dirname(schema_info)}.rb"
    
    generator     = OpenapiObject::PatternedObject::ClassGenerator.new(schema_info)

    create_directory(output_path)
    File.write output_path, eruby.result(generator: generator)
  end

  def create_cherry_object_class(schema_info, template_name)
    template_path = File.expand_path "generators/templates/class_generators/#{template_name}.rb.erb", root
    eruby         = SimpleSwaggerDocs::Eruby.new(File.read(template_path))
    output_path   = File.expand_path "#{version_relative_path(schema_info.version)}/schema/generated/#{schema_object_name_with_dirname(schema_info)}.rb"

    generator     = OpenapiObject::CherryObject::ClassGenerator.new(schema_info)

    create_directory(output_path)
    File.write output_path, eruby.result(generator: generator)
  end

  def create_openapi_object_property_module(included_class_instance, module_includer, template_name)
    template_path      = File.expand_path "generators/templates/module_generators/#{template_name}.rb.erb", root
    eruby              = SimpleSwaggerDocs::Eruby.new(File.read(template_path))
    schema_object_name = module_includer.schema_object_name
    schema_object_name_with_dirname = -> {
      schema_dirname = Pathname(module_includer.schema_relative_filepath).relative_path_from(Pathname('.'))
      "#{schema_dirname}/#{schema_object_name}"
    }
    output_path = File.expand_path "#{version_relative_path(included_class_instance.schema_version)}/schema/generated/#{schema_object_name_with_dirname.call}.rb"
    generator = OpenapiObject::ModuleGenerator.new(included_class_instance, schema_object_name)

    create_directory(output_path)
    File.write output_path, eruby.result(generator: generator)
  end

  def create_directory(output_path)
    dirname = File.dirname(output_path)
    FileUtils.mkdir_p(dirname) unless FileTest.exist?(dirname)
  end

  def schema_object_name_with_dirname(schema_info)
    schema_object_name       = schema_info.object_name
    schema_relative_filepath = schema_info.relative_filepath
    schema_dirname           = File.dirname(schema_relative_filepath)
    dirname_schema_root?(schema_info) ? schema_object_name : "#{schema_dirname}/#{schema_object_name}"
  end

  def dirname_schema_root?(schema_info)
    File.dirname(schema_info.relative_filepath) == '.'
  end

  def schema_root_dirname(version)
    Pathname("#{root}/generators/schema/#{version}")
  end

  def schema_root_dirdepth(version)
    File.dirname("#{root}/generators/schema/#{version}/openapi_object.yaml").split('/').size
  end

  def root
    File.expand_path '../../../', __FILE__
  end

  def version_relative_path(version)
    "lib/simple_swagger_docs/#{version}"
  end
end
