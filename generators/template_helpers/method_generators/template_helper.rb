#frozen_string_literal:true

require_relative 'base_template_helper'
require_relative 'root/template_helper'
require_relative 'node/template_helper'

# Scope: OpenapiObject::MethodGenerator
module OpenapiObject
  module MethodGenerators
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
        if root_schema_object_name?
          Root::TemplateHelper.new(@method_content_generator, node_object_builder)
        else
          Node::TemplateHelper.new(@method_content_generator, node_object_builder)
        end
      end
    end
  end
end
