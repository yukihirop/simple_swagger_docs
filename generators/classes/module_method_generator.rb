#frozen_string_literal:true

require_relative 'method_generators/base_method_generator'
require_relative 'module_method_content_generator'

module OpenapiObject
  class ModuleMethodGenerator < MethodGenerators::BaseMethodGenerator
    private

    def create_method_content_generator
      @method_content_generator ||= ModuleMethodContentGenerator.new(self, @included_class_instance)
    end
  end
end
