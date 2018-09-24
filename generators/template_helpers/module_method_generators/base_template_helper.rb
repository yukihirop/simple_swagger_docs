#frozen_string_literal:true

require_relative '../../classes/config_methods'
require 'active_support'
require 'active_support/core_ext'

# Scope: OpenapiObject::ModuleMethodGenerator
module OpenapiObject
  module ModuleMethodGenerators
    class BaseTemplateHelper < OpenapiObject::BaseTemplateHelper
      def initialize(method_content_generator, node_object_builder = nil, included_class_instance)
        @included_class_instance = included_class_instance
        super
      end
    end
  end
end
