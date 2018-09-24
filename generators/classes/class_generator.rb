#frozen_string_literal:true

require_relative 'method_generator'
require_relative 'class_generators/module_includable'
require_relative 'node_builders/node_object_builder'
require_relative 'filepath_methods'

module OpenapiObject
  class ClassGenerator
    include ConfigMethods
    include ModuleIncludable
    include FilePathMethods

    attr_accessor :schema_name, :schema_object_name, :class_name, :schema_version, :schema_relative_filepath, :schema_relative_dirdepth

    def initialize(schema_info)
      self.schema_name              = remove_object(schema_info.object_name)
      self.schema_object_name       = schema_info.object_name
      self.class_name               = schema_info.object_name.camelize
      self.schema_version           = schema_info.version
      self.schema_relative_filepath = schema_info.relative_filepath
      self.schema_relative_dirdepth = schema_info.relative_dirdepth
    end

    def require_contents
      all_fixed_fields.select(&:have_node_object?).map do |method_generator|
        node_object_name    = method_generator.method_content_object.underscore
        node_object_builder = create_node_object_builder(node_object_name)
        relative_filepath   = relative_filepath(node_object_builder.filepath, filepath)
        node_object_builder_filename = node_object_builder.file_name
        if relative_filepath == '.'
          node_object_builder_filename
        else
          "#{relative_filepath}/#{node_object_builder_filename}"
        end
      end.uniq
    end

    def attribute_accessors
      all_fixed_fields.to_a
    end

    def initialize_attributes
      all_fixed_fields.select(&:defined_method?)
    end

    def generated_methods
      all_fixed_fields.reject(&:defined_method?)
    end

    def patterned_methods
      class_fixed_fields = all_fixed_fields.select(&:method_name_at_schema_patterned?).map(&:method_name_at_schema)
      module_fixed_fields = module_includers.map(&:patterned_methods)
      (class_fixed_fields + module_fixed_fields).flatten
    end

    def required_args
      all_fixed_fields.select(&:required?).map(&:method_name_at_schema)
    end

    private

    def filepath
      openapi_object_filepath.to_s
    end

    def all_fixed_fields
      all_fixed_fields = openapi_object_fixed_fields.keys
      @all_fixed_fields ||= Enumerator.new do |yielder|
        all_fixed_fields.each do |propterty|
          yielder << MethodGenerator.new(self, propterty)
        end
      end
    end

    def create_node_object_builder(node_object_name)
      OpenapiObject::NodeBuilders::NodeObjectBuilder.build(node_object_name)
    end
  end
end
