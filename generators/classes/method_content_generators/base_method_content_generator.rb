#frozen_string_literal:true

require_relative '../node_builders/node_object_builder'
require_relative '../config_methods'

module OpenapiObject
  module MethodContentGenerators
    class BaseMethodContentGenerator
      include OpenapiObject::ConfigMethods
      extend Forwardable

      attr_accessor :method_content_object
      def_delegators :@template_helper, :method_signature, :method_content
      def_delegators :@node_object_builder, :have_node_object?
      def_delegators :@parent_generator, :schema_name, :schema_object_name, :schema_version, :method_name_at_schema

      def initialize(parent_generator, incldued_class_instance = nil)
        @parent_generator          = parent_generator
        @incldued_class_instance   = incldued_class_instance
        self.method_content_object = method_content_object
        create_node_object_builder
        create_template_helper
      end

      def method_content_object
        case adjusted_type_instance
        when String
          openapi_object_method_type
        when Array
          openapi_object_method_type.first
        when Hash
          openapi_object_method_type[:value]
        end
      end

      def method_content_type
        adjusted_type_instance
      end

      private

      def type_instance
        openapi_object_method_type.class.new
      end

      def adjusted_type_instance
        subject = openapi_object_method_type
        case
        when subject.is_a?(Config::Options) && subject.respond_to?(:to_hash)
          {}
        else
          subject
        end
      end

      def create_node_object_builder
        @node_object_builder ||= OpenapiObject::NodeBuilders::NodeObjectBuilder.build(method_content_object.underscore)
      end

      def create_template_helper
        raise ImplementError
      end
    end
  end
end
