#frozen_string_literal:true

# Generated Date: 2018-09-25
# Template File:  generators/templates/class_generators/openapi_object_node_class_template.rb.erb
#
# This file was auto-generated by generators/tasks/generate.rb
#
# Please do not modify this file
# Please modify here: lib/simple_swagger_docs/v3/generators/schema

require_relative '../../patterned/custom/property_patterned_object'
require_relative '../../../node_updatable'
require_relative '../../../docs_methods'

module SimpleSwaggerDocs
  module V3
    module Schema
      class CustomJsonSchemaObject
        include NodeUpdatable
        include DocsMethods

        class << self
          def have_patterned_methods?
            true
          end
        end

        attr_accessor :properties
        attr_accessor :additionalProperties
        attr_accessor :custom_json_schema_object

        def initialize(openapi_data = {})
          check_initialize_args(openapi_data)

          @openapi_data = openapi_data
          @custom_json_schema_object ||= {
            properties: nil,
            additionalProperties: nil,
          }
          
        end
    
        def properties
          if openapi_data_at_custom_json_schema_object&.fetch(:properties, nil).is_a?(Hash)
            return @custom_json_schema_object[:properties] unless @custom_json_schema_object[:properties].nil?
            properties_content = []
            openapi_data_at_custom_json_schema_object[:properties].each do |key, value|
              data = { name: key, content: value }
              properties_content << PropertyPatternedObject.new(data)
            end
            @custom_json_schema_object[:properties] = properties_content
          else
            @custom_json_schema_object[:properties] || openapi_data_at_custom_json_schema_object[:properties]
          end
        end
    
        def additionalProperties
          if openapi_data_at_custom_json_schema_object&.fetch(:additionalProperties, nil).is_a?(Hash)
            return @custom_json_schema_object[:additionalProperties] unless @custom_json_schema_object[:additionalProperties].nil?
            additionalProperties_content = []
            openapi_data_at_custom_json_schema_object[:additionalProperties].each do |key, value|
              data = { name: key, content: value }
              additionalProperties_content << PropertyPatternedObject.new(data)
            end
            @custom_json_schema_object[:additionalProperties] = additionalProperties_content
          else
            @custom_json_schema_object[:additionalProperties] || openapi_data_at_custom_json_schema_object[:additionalProperties]
          end
        end

        def have_patterned_content?(method_name)
          [:properties, :additionalProperties].include?(method_name)
        end

        def patterned_object?
          false
        end

        private

        def openapi_data_at_custom_json_schema_object
          if @openapi_data.is_a?(Hash)
            @openapi_data
          else
            raise
          end
        end

        def check_initialize_args(openapi_data)
          bad_args = []
          unless bad_args.empty?
            required_keys = bad_args.join(',')
            raise "initialize args: #{required_keys} is required."
          end
        end
      end
    end
  end
end