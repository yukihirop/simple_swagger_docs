#frozen_string_literal:true

require_relative '../module_includer'

module OpenapiObject
  module ModuleIncludable
    include ConfigMethods

    def module_includers
      all_module_includers.to_a
    end

    private

    def all_module_includers
      all_module_includers = openapi_object_meta_includes
      return [] if all_module_includers.empty?
      @all_module_includers ||= Enumerator.new do |yielder|
        all_module_includers.each do |include_module_name|
          yielder << ModuleIncluder.new(schema_object_name, include_module_name.underscore)
        end
      end
    end
  end
end
