#frozen_string_literal:true

require 'config'
require 'pry'

module YamlRouter
  module Statable
    def config_options?
      @object_or_value.is_a?(Config::Options)
    end

    def value?
      @object_or_value.is_a?(Integer) || @object_or_value.is_a?(TrueClass) || @object_or_value.is_a?(FalseClass)
    end

    def array?
      @object_or_value.is_a?(Array)
    end

    def hash?
      @object_or_value.is_a?(Hash)
    end

    def object?
      !!@object_or_value.match(/Object/)
    end

    def cherry_object?
      !!@object_or_value.match(/CherryObject/)
    end
  end
end