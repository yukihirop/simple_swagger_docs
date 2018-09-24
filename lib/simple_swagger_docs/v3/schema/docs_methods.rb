#frozen_string_literal:true

require_relative 'transform_keys_methods'
require 'active_support'
require 'active_support/core_ext'

module SimpleSwaggerDocs
  module V3
    module Schema
      module DocsMethods
        include SimpleSwaggerDocs::V3::Schema::TransformKeysMethods

        def generate_api_docs
          json = transform_keys_for_api(to_docs).to_json
          File.write('api_docs.json', json)
        end

        def to_docs
          @docs ||= {}
          public_send(repository).each do |method_name, _|
            method_result = self.public_send(method_name)

            if method_result.nil?
              @docs[method_name] = nil
            elsif have_patterned_content?(method_name)
              to_docs_when_patterned_object(method_result)
            else
              if method_result.is_a?(String) || method_result.is_a?(Integer) || method_result.is_a?(TrueClass) || method_result.is_a?(FalseClass)
                @docs[method_name] = method_result
              elsif method_result.is_a?(Array)
                @docs[method_name] = to_docs_when_array(method_result)
              elsif method_result.is_a?(Hash)
                @docs[method_name] = to_docs_when_hash(method_result)
              else
                # Case When method_result is ***Object.
                @docs[method_name] = method_result&.to_docs
              end
            end
          end

          @docs.delete_if do |k, v|
            # Special treatment
            next if k == :api_key
            case v
            when Array || Hash
              v.blank?
            else
              v.nil?
            end
          end
        end

        private

        def to_docs_when_array(object_arr)
          object_arr.map do |object|
            if object.respond_to?(:to_docs)
              object.to_docs
            else
              object
            end
          end
        end

        def to_docs_when_hash(object_data)
          object_data.each_with_object({}) do |(key, object), result|
            if object.respond_to?(:to_docs)
              result[key] = object.to_docs
            else
              result[key] = object
            end
          end
        end

        def to_docs_when_patterned_object(patterned_object_arr)
          patterned_object_arr.map do |patterned_object|
            if patterned_object.patterned_object?
              patterned_object
            else
              raise "Do not support at [to_docs_when_patterned_object]."
            end
          end.each do |patterned_object|
            key   = patterned_object.name
            value = patterned_object.content
            value_to_docs = if value.respond_to?(:to_docs)
                              value.to_docs
                            else
                              value
                            end
            @docs[key] = value_to_docs
          end
          @docs
        end

        def repository
          if self == SimpleSwaggerDocs::V3::Schema::OpenapiObject
            name.demodulize.underscore.to_sym
          else
            self.class.to_s.demodulize.underscore.to_sym
          end
        end
      end
    end
  end
end
