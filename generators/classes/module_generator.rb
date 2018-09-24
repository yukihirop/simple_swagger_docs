#frozen_string_literal:true

require_relative 'module_method_generator'
require_relative 'node_builders/node_object_builder'
require_relative 'filepath_methods'

module OpenapiObject
  class ModuleGenerator
    include ConfigMethods
    include FilePathMethods
    extend Forwardable

    attr_accessor :schema_name, :schema_object_name, :module_name
    def_delegator :@included_class_instance, :schema_version

    def initialize(included_class_instance, schema_object_name)
      @included_class_instance = included_class_instance
      self.schema_name         = remove_object(schema_object_name)
      self.schema_object_name  = schema_object_name
      self.module_name         = schema_object_name.camelize
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

    private

    def filepath
      openapi_object_filepath.to_s
    end

    def all_fixed_fields
      all_fixed_fields = openapi_object_fixed_fields.keys
      @all_fixed_fields ||= Enumerator.new do |yielder|
        all_fixed_fields.each do |property|
          yielder << ModuleMethodGenerator.new(self, property, @included_class_instance)
        end
      end
    end

    def create_node_object_builder(node_object_name)
      OpenapiObject::NodeBuilders::NodeObjectBuilder.build(node_object_name)
    end
  end
end
