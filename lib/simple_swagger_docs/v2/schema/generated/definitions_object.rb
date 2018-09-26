#frozen_string_literal:true

# Generated Date: 2018-09-26
# Template File:  generators/templates/class_generators/openapi_object_node_class_template.rb.erb
#
# This file was auto-generated by generators/tasks/generate.rb
#
# Please do not modify this file
# Please modify here: lib/simple_swagger_docs/v2/generators/schema

require_relative 'patterned/name/name_schema_object_patterned_object'
require_relative '../node_updatable'
require_relative '../docs_methods'

module SimpleSwaggerDocs
  module V2
    module Schema
      class DefinitionsObject
        include NodeUpdatable
        include DocsMethods

        class << self
          def have_patterned_methods?
            true
          end
        end

        attr_accessor :definitions
        attr_accessor :definitions_object

        def initialize(openapi_data = {})
          check_initialize_args(openapi_data)

          @openapi_data = openapi_data
          @definitions_object ||= {
            definitions: nil,
          }
          
        end
    
        def definitions
          if openapi_data_at_definitions_object&.fetch(:definitions, nil).is_a?(Hash)
            return @definitions_object[:definitions] unless @definitions_object[:definitions].nil?
            definitions_content = []
            openapi_data_at_definitions_object[:definitions].each do |key, value|
              data = { name: key, content: value }
              definitions_content << NameSchemaObjectPatternedObject.new(data)
            end
            @definitions_object[:definitions] = definitions_content
          else
            @definitions_object[:definitions] || openapi_data_at_definitions_object[:definitions]
          end
        end

        def have_patterned_content?(method_name)
          [:definitions].include?(method_name)
        end

        def patterned_object?
          false
        end

        private

        def openapi_data_at_definitions_object
          if @openapi_data.is_a?(Hash)
            @openapi_data
          else
            raise
          end
        end

        def check_initialize_args(openapi_data)
          bad_args = []
          unless bad_args.empty?
            required_keys = bad_args.join(', ')
            raise "initialize args: #{required_keys} is required."
          end
        end
      end
    end
  end
end
