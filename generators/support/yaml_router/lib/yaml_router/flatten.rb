#frozen_string_literal: true

require 'pry'

module YamlRouter
  module Flatten
    SEPARATOR_ESCAPE_CHAR = "\001"
    FLATTEN_SEPARATOR = "."

    def flatten_definitions(data, escape, subtree)
      result = {}
      flatten_keys(data, escape) do |key, value|
        if value.is_a?(Hash)
          result[key] = value if subtree
        else
          result[key] = value
        end
      end
      result
    end

    def flatten_keys(data, escape, prev_key = nil, &block)
      data.each_pair do |key, value|
        key = escape_default_separator(key) if escape
        curr_key = [prev_key, key].compact.join(FLATTEN_SEPARATOR).to_sym
        yield curr_key, value
        flatten_keys(value, escape, curr_key, &block) if value.is_a?(Hash)
      end
    end

    def self.escape_default_separator(key)
      key.to_s.tr(FLATTEN_SEPARATOR, SEPARATOR_ESCAPE_CHAR)
    end

    private

    def escape_default_separator(key)
      YamlRouter::Flatten.escape_default_separator(key)
    end
  end
end