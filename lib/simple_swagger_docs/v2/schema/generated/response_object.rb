#frozen_string_literal:true

# Generated Date: 2018-09-26
# Template File:  generators/templates/class_generators/openapi_object_node_class_template.rb.erb
#
# This file was auto-generated by generators/tasks/generate.rb
#
# Please do not modify this file
# Please modify here: lib/simple_swagger_docs/v2/generators/schema

require_relative 'schema_object'
require_relative 'headers_object'
require_relative 'example_object'
require_relative '../node_updatable'
require_relative '../docs_methods'

module SimpleSwaggerDocs
  module V2
    module Schema
      class ResponseObject
        include NodeUpdatable
        include DocsMethods

        class << self
          def have_patterned_methods?
            false
          end
        end

        attr_accessor :description
        attr_accessor :schema
        attr_accessor :headers
        attr_accessor :examples
        attr_accessor :response_object

        def initialize(openapi_data = {})
          check_initialize_args(openapi_data)

          self.description = openapi_data[:description]
          @openapi_data = openapi_data
          @response_object ||= {
            description: nil,
            schema: nil,
            headers: nil,
            examples: nil,
          }
          
        end
    
        def schema
          if openapi_data_at_response_object&.fetch(:schema, nil).is_a?(Hash)
            return @response_object[:schema] unless @response_object[:schema].nil?
            data = @openapi_data[:schema]
            if SchemaObject.have_patterned_methods?
              data = { schema: data }
            end
            @response_object[:schema] = SchemaObject.new(data)
          else
            @response_object[:schema] || openapi_data_at_response_object[:schema]
          end
        end
    
        def headers
          if openapi_data_at_response_object&.fetch(:headers, nil).is_a?(Hash)
            return @response_object[:headers] unless @response_object[:headers].nil?
            data = @openapi_data[:headers]
            if HeadersObject.have_patterned_methods?
              data = { headers: data }
            end
            @response_object[:headers] = HeadersObject.new(data)
          else
            @response_object[:headers] || openapi_data_at_response_object[:headers]
          end
        end
    
        def examples
          if openapi_data_at_response_object&.fetch(:examples, nil).is_a?(Hash)
            return @response_object[:examples] unless @response_object[:examples].nil?
            data = @openapi_data[:examples]
            if ExampleObject.have_patterned_methods?
              data = { examples: data }
            end
            @response_object[:examples] = ExampleObject.new(data)
          else
            @response_object[:examples] || openapi_data_at_response_object[:examples]
          end
        end

        def have_patterned_content?(method_name)
          false
        end

        def patterned_object?
          false
        end

        private

        def openapi_data_at_response_object
          if @openapi_data.is_a?(Hash)
            @openapi_data
          else
            raise
          end
        end

        def check_initialize_args(openapi_data)
          bad_args = []
          bad_args << :description if openapi_data[:description].nil?
          unless bad_args.empty?
            required_keys = bad_args.join(', ')
            raise "initialize args: #{required_keys} is required."
          end
        end
      end
    end
  end
end
