#frozen_string_literal:true

require 'active_support'
require 'active_support/core_ext'

module SimpleSwaggerDocs
  module V2
    module Schema
      module TransformKeysMethods
        def transform_keys_for_api(docs)
          @transform_key_for_api_docs ||= docs
          @transform_key_for_api_docs.transform_keys do |key|
            transform_key(key)
          end.transform_values do |value|
            if value.is_a?(Hash)
              transform_keys_for_api_when_hash(value)
            elsif value.is_a?(Array)
              transform_keys_for_api_when_array(value)
            else
              value
            end
          end
        end

        private

        def transform_keys_for_api_when_array(arr)
          arr.map do |el|
            if el.is_a?(Hash)
              transform_keys_for_api_when_hash(el)
            elsif el.is_a?(Array)
              transform_keys_for_api_when_array(el)
            else
              el
            end
          end
        end

        def transform_keys_for_api_when_hash(data)
          data.transform_keys do |key|
            transform_key(key)
          end.transform_values do |value|
            if value.is_a?(Hash)
              transform_keys_for_api_when_hash(value)
            elsif value.is_a?(Array)
              transform_keys_for_api_when_array(value)
            else
              value
            end
          end
        end

        def transform_key(key)
          case key
          when :_in
            :in
          when :_ref
            :'$ref'
          else
             key
          end
        end
      end
    end
  end
end
