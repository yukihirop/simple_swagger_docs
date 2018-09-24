#frozen_string_literal:true

require_relative '../config_methods'

module OpenapiObject
  module MethodGenerators
    class BaseMethodGenerator
      include OpenapiObject::ConfigMethods
      extend Forwardable

      attr_accessor :method_name_at_schema
      def_delegators :@method_content_generator, :method_signature, :method_content, :method_content_object
      def_delegators :@method_content_generator, :have_node_object?
      def_delegators :@parent_generator, :schema_name, :schema_object_name, :schema_version

      def initialize(parent_generator, method_name_at_schema, included_class_instance = nil)
        @parent_generator          = parent_generator
        @included_class_instance   = included_class_instance
        self.method_name_at_schema = method_name_at_schema
        create_method_content_generator
      end

      def defined_method?
        !use_config? && !have_node_object?
      end

      private

      def create_method_content_generator
        raise ImplementError
      end
    end
  end
end
