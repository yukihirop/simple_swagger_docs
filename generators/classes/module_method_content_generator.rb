#frozen_string_literal:true

require_relative '../template_helpers/module_method_generators/template_helper'
require_relative 'method_content_generators/base_method_content_generator'

module OpenapiObject
  class ModuleMethodContentGenerator < MethodContentGenerators::BaseMethodContentGenerator
    private

    def create_template_helper
      @template_helper ||= OpenapiObject::ModuleMethodGenerators::TemplateHelper.new(
        self,
        @node_object_builder,
        @incldued_class_instance
      )
    end
  end
end
