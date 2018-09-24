#frozen_string_literal:true

# Generated Date: 2018-09-25
# Template File:  generators/templates/class_generators/openapi_object_node_class_template.rb.erb
#
# This file was auto-generated by generators/tasks/generate.rb
#
# Please do not modify this file
# Please modify here: lib/simple_swagger_docs/v2/generators/schema

require_relative 'schema_object'
require_relative 'items_object'
require_relative '../node_updatable'
require_relative '../docs_methods'

module SimpleSwaggerDocs
  module V2
    module Schema
      class ParameterObject
        include NodeUpdatable
        include DocsMethods

        class << self
          def have_patterned_methods?
            false
          end
        end

        attr_accessor :name
        attr_accessor :_in
        attr_accessor :description
        attr_accessor :required
        attr_accessor :schema
        attr_accessor :type
        attr_accessor :format
        attr_accessor :allowEmptyValue
        attr_accessor :items
        attr_accessor :collectionFormat
        attr_accessor :default
        attr_accessor :maximum
        attr_accessor :exclusiveMaximum
        attr_accessor :minimum
        attr_accessor :exclusiveMinimum
        attr_accessor :maxLength
        attr_accessor :minLength
        attr_accessor :pattern
        attr_accessor :maxItems
        attr_accessor :minItems
        attr_accessor :uniqueItems
        attr_accessor :enum
        attr_accessor :multipleOf
        attr_accessor :parameter_object

        def initialize(openapi_data = {})
          check_initialize_args(openapi_data)

          self.name = openapi_data[:name]
          self._in = openapi_data[:_in]
          self.description = openapi_data[:description]
          self.required = openapi_data[:required]
          self.type = openapi_data[:type]
          self.format = openapi_data[:format]
          self.allowEmptyValue = openapi_data[:allowEmptyValue]
          self.collectionFormat = openapi_data[:collectionFormat]
          self.default = openapi_data[:default]
          self.maximum = openapi_data[:maximum]
          self.exclusiveMaximum = openapi_data[:exclusiveMaximum]
          self.minimum = openapi_data[:minimum]
          self.exclusiveMinimum = openapi_data[:exclusiveMinimum]
          self.maxLength = openapi_data[:maxLength]
          self.minLength = openapi_data[:minLength]
          self.pattern = openapi_data[:pattern]
          self.maxItems = openapi_data[:maxItems]
          self.minItems = openapi_data[:minItems]
          self.uniqueItems = openapi_data[:uniqueItems]
          self.enum = openapi_data[:enum]
          self.multipleOf = openapi_data[:multipleOf]
          @openapi_data = openapi_data
          @parameter_object ||= {
            name: nil,
            _in: nil,
            description: nil,
            required: nil,
            schema: nil,
            type: nil,
            format: nil,
            allowEmptyValue: nil,
            items: nil,
            collectionFormat: nil,
            default: nil,
            maximum: nil,
            exclusiveMaximum: nil,
            minimum: nil,
            exclusiveMinimum: nil,
            maxLength: nil,
            minLength: nil,
            pattern: nil,
            maxItems: nil,
            minItems: nil,
            uniqueItems: nil,
            enum: nil,
            multipleOf: nil,
          }
          
        end
    
        def schema
          if openapi_data_at_parameter_object&.fetch(:schema, nil).is_a?(Hash)
            return @parameter_object[:schema] unless @parameter_object[:schema].nil?
            data = @openapi_data[:schema]
            if SchemaObject.have_patterned_methods?
              data = { schema: data }
            end
            @parameter_object[:schema] = SchemaObject.new(data)
          else
            @parameter_object[:schema] || openapi_data_at_parameter_object[:schema]
          end
        end
    
        def items
          if openapi_data_at_parameter_object&.fetch(:items, nil).is_a?(Hash)
            return @parameter_object[:items] unless @parameter_object[:items].nil?
            data = @openapi_data[:items]
            if ItemsObject.have_patterned_methods?
              data = { items: data }
            end
            @parameter_object[:items] = ItemsObject.new(data)
          else
            @parameter_object[:items] || openapi_data_at_parameter_object[:items]
          end
        end

        def have_patterned_content?(method_name)
          false
        end

        def patterned_object?
          false
        end

        private

        def openapi_data_at_parameter_object
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
