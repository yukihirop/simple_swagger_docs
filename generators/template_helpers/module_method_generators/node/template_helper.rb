#frozen_string_literal:true

require_relative 'string_template_helper'
require_relative 'array_template_helper'
require_relative 'hash_template_helper'

# Scope: OpenapiObject::ModuleMethodGenerator
module OpenapiObject
  module ModuleMethodGenerators
    module Node
      class TemplateHelper < OpenapiObject::ModuleMethodGenerators::BaseTemplateHelper
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
          case method_content_type
          when String
            StringTemplateHelper.new(@method_content_generator, node_object_builder, @included_class_instance)
          when Array
            ArrayTemplateHelper.new(@method_content_generator, node_object_builder, @included_class_instance)
          when Hash
            HashTemplateHelper.new(@method_content_generator, node_object_builder, @included_class_instance)
          else
            nil
          end
        end
      end
    end
  end
end
