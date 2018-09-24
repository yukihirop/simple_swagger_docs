#frozen_string_literal:true

require_relative 'method_generators/base_method_generator'
require_relative 'method_content_generator'

module OpenapiObject
  class MethodGenerator < MethodGenerators::BaseMethodGenerator
    private

    def create_method_content_generator
      @method_content_generator ||= MethodContentGenerator.new(self)
    end
  end
end
