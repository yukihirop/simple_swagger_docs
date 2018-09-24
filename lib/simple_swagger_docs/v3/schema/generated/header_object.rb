#frozen_string_literal:true

# Generated Date: 2018-09-25
# Template File:  generators/templates/class_generators/openapi_object_node_class_template.rb.erb
#
# This file was auto-generated by generators/tasks/generate.rb
#
# Please do not modify this file
# Please modify here: lib/simple_swagger_docs/v3/generators/schema

require_relative 'schema_object'
require_relative 'example_object'
require_relative 'media_type_object'
require_relative '../node_updatable'
require_relative '../docs_methods'

module SimpleSwaggerDocs
  module V3
    module Schema
      class HeaderObject
        include NodeUpdatable
        include DocsMethods

        class << self
          def have_patterned_methods?
            false
          end
        end

        attr_accessor :description
        attr_accessor :required
        attr_accessor :deprecated
        attr_accessor :allowEmptyValue
        attr_accessor :style
        attr_accessor :explode
        attr_accessor :allowReserved
        attr_accessor :schema
        attr_accessor :example
        attr_accessor :examples
        attr_accessor :content
        attr_accessor :header_object

        def initialize(openapi_data = {})
          check_initialize_args(openapi_data)

          self.description = openapi_data[:description]
          self.required = openapi_data[:required]
          self.deprecated = openapi_data[:deprecated]
          self.allowEmptyValue = openapi_data[:allowEmptyValue]
          self.style = openapi_data[:style]
          self.explode = openapi_data[:explode]
          self.allowReserved = openapi_data[:allowReserved]
          self.example = openapi_data[:example]
          @openapi_data = openapi_data
          @header_object ||= {
            description: nil,
            required: nil,
            deprecated: nil,
            allowEmptyValue: nil,
            style: nil,
            explode: nil,
            allowReserved: nil,
            schema: nil,
            example: nil,
            examples: nil,
            content: nil,
          }
          
        end
    
        def schema
          if openapi_data_at_header_object&.fetch(:schema, nil).is_a?(Hash)
            return @header_object[:schema] unless @header_object[:schema].nil?
            data = @openapi_data[:schema]
            if SchemaObject.have_patterned_methods?
              data = { schema: data }
            end
            @header_object[:schema] = SchemaObject.new(data)
          else
            @header_object[:schema] || openapi_data_at_header_object[:schema]
          end
        end
    
        def examples
          if openapi_data_at_header_object&.fetch(:examples, nil).is_a?(Hash)
            return @header_object[:examples] unless @header_object[:examples].nil?
            examples_content = {}
            openapi_data_at_header_object[:examples].each do |key, data|
              examples_content[key] = ExampleObject.new(data)
            end
            @header_object[:examples] = examples_content
          else
            @header_object[:examples] || openapi_data_at_header_object[:examples]
          end
        end
    
        def content
          if openapi_data_at_header_object&.fetch(:content, nil).is_a?(Hash)
            return @header_object[:content] unless @header_object[:content].nil?
            content_content = {}
            openapi_data_at_header_object[:content].each do |key, data|
              content_content[key] = MediaTypeObject.new(data)
            end
            @header_object[:content] = content_content
          else
            @header_object[:content] || openapi_data_at_header_object[:content]
          end
        end

        def have_patterned_content?(method_name)
          false
        end

        def patterned_object?
          false
        end

        private

        def openapi_data_at_header_object
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
