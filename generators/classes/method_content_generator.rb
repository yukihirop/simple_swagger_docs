#frozen_string_literal:true

require_relative '../template_helpers/method_generators/template_helper'
require_relative 'method_content_generators/base_method_content_generator'

module OpenapiObject
  class MethodContentGenerator < MethodContentGenerators::BaseMethodContentGenerator
    private

    def create_template_helper
      @template_helper ||= OpenapiObject::MethodGenerators::TemplateHelper.new(
        self,
        @node_object_builder
      )
    end
  end
end
