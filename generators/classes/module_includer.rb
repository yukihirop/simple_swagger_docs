#frozen_string_literal:true

require_relative 'method_generator'
require_relative 'filepath_methods'

module OpenapiObject
  class ModuleIncluder
    include ConfigMethods
    include FilePathMethods

    attr_accessor :included_schema_object_name, :schema_object_name, :schema_relative_filepath

    def initialize(included_schema_object_name, schema_object_name)
      self.included_schema_object_name = included_schema_object_name
      self.schema_object_name          = schema_object_name
      create_included_node_object_builder
    end

    def require_content
      relative_filepath = relative_filepath(schema_relative_filepath, @included_node_object_builder.filepath)
      if relative_filepath == '.'
        schema_object_name
      else
        "#{relative_filepath}/#{schema_object_name}"
      end
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
      all_fixed_fields.select(&:method_name_at_schema_patterned?).map(&:method_name_at_schema)
    end

    def required_args
      all_fixed_fields.select(&:required?).map(&:method_name_at_schema)
    end

    def all_fixed_fields
      all_fixed_fields = include_module_openapi_object_fixed_fields.keys
      return [] if all_fixed_fields.empty?
      @all_fixed_fields ||= Enumerator.new do |yielder|
        all_fixed_fields.each do |property|
          yielder << MethodGenerator.new(self, property)
        end
      end
    end

    def schema_relative_filepath
      openapi_object_filepath.to_s
    end

    private

    def create_included_node_object_builder
      @included_node_object_builder ||= OpenapiObject::NodeBuilders::NodeObjectBuilder.build(included_schema_object_name)
    end
  end
end
