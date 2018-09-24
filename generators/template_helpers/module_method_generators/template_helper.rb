#frozen_string_literal:true

require_relative 'base_template_helper'
require_relative 'node/template_helper'

# Scope: OpenapiObject::ModuleMethodGenerator
module OpenapiObject
  module ModuleMethodGenerators
    class TemplateHelper < BaseTemplateHelper
      include OpenapiObject::ConfigMethods

      def_delegators :@method_content_generator, :method_content_type

      def method_signature
        if template_helper.nil?
          method_name_at_schema
        else
          template_helper.method_signature
        end
      end

      def method_content
        if template_helper.nil?
          raise "\"Do not Support. (#{openapi_object_method_type})\""
        else
          template_helper.method_content
        end
      end

      private

      def template_helper
        unless root_schema_object_name?
          Node::TemplateHelper.new(@method_content_generator, node_object_builder, @included_class_instance)
        end
      end
    end
  end
end
