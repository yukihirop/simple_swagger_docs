#frozen_string_literal:true

# Generated Date: 2018-09-25
# Template File:  generators/templates/class_generators/openapi_object_node_class_template.rb.erb
#
# This file was auto-generated by generators/tasks/generate.rb
#
# Please do not modify this file
# Please modify here: lib/simple_swagger_docs/v2/generators/schema

require_relative 'patterned/name/name_security_schema_object_patterned_object'
require_relative '../node_updatable'
require_relative '../docs_methods'

module SimpleSwaggerDocs
  module V2
    module Schema
      class SecurityDefinitionsObject
        include NodeUpdatable
        include DocsMethods

        class << self
          def have_patterned_methods?
            true
          end
        end

        attr_accessor :securityDefinitions
        attr_accessor :security_definitions_object

        def initialize(openapi_data = {})
          check_initialize_args(openapi_data)

          @openapi_data = openapi_data
          @security_definitions_object ||= {
            securityDefinitions: nil,
          }
          
        end
    
        def securityDefinitions
          if openapi_data_at_security_definitions_object&.fetch(:securityDefinitions, nil).is_a?(Hash)
            return @security_definitions_object[:securityDefinitions] unless @security_definitions_object[:securityDefinitions].nil?
            securityDefinitions_content = []
            openapi_data_at_security_definitions_object[:securityDefinitions].each do |key, value|
              data = { name: key, content: value }
              securityDefinitions_content << NameSecuritySchemaObjectPatternedObject.new(data)
            end
            @security_definitions_object[:securityDefinitions] = securityDefinitions_content
          else
            @security_definitions_object[:securityDefinitions] || openapi_data_at_security_definitions_object[:securityDefinitions]
          end
        end

        def have_patterned_content?(method_name)
          [:securityDefinitions].include?(method_name)
        end

        def patterned_object?
          false
        end

        private

        def openapi_data_at_security_definitions_object
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