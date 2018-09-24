#frozen_string_literal:true

# Generated Date: 2018-09-25
# Template File:  generators/templates/class_generators/openapi_object_node_class_template.rb.erb
#
# This file was auto-generated by generators/tasks/generate.rb
#
# Please do not modify this file
# Please modify here: lib/simple_swagger_docs/v3/generators/schema

require_relative 'cherry/schema_cherry_object'
require_relative 'cherry/example_cherry_object'
require_relative 'encoding_object'
require_relative '../node_updatable'
require_relative '../docs_methods'

module SimpleSwaggerDocs
  module V3
    module Schema
      class MediaTypeObject
        include NodeUpdatable
        include DocsMethods

        class << self
          def have_patterned_methods?
            false
          end
        end

        attr_accessor :schema
        attr_accessor :example
        attr_accessor :examples
        attr_accessor :encoding
        attr_accessor :media_type_object

        def initialize(openapi_data = {})
          check_initialize_args(openapi_data)

          self.example = openapi_data[:example]
          @openapi_data = openapi_data
          @media_type_object ||= {
            schema: nil,
            example: nil,
            examples: nil,
            encoding: nil,
          }
          
        end
    
        def schema
          if openapi_data_at_media_type_object&.fetch(:schema, nil).is_a?(Hash)
            return @media_type_object[:schema] unless @media_type_object[:schema].nil?
            data = @openapi_data[:schema]
            if SchemaCherryObject.have_patterned_methods?
              data = { schema: data }
            end
            @media_type_object[:schema] = SchemaCherryObject.build(data)
          else
            @media_type_object[:schema] || openapi_data_at_media_type_object[:schema]
          end
        end
    
        def examples
          if openapi_data_at_media_type_object&.fetch(:examples, nil).is_a?(Hash)
            return @media_type_object[:examples] unless @media_type_object[:examples].nil?
            examples_content = {}
            openapi_data_at_media_type_object[:examples].each do |key, data|
              examples_content[key] = ExampleCherryObject.build(data)
            end
            @media_type_object[:examples] = examples_content
          else
            @media_type_object[:examples] || openapi_data_at_media_type_object[:examples]
          end
        end
    
        def encoding
          if openapi_data_at_media_type_object&.fetch(:encoding, nil).is_a?(Hash)
            return @media_type_object[:encoding] unless @media_type_object[:encoding].nil?
            encoding_content = {}
            openapi_data_at_media_type_object[:encoding].each do |key, data|
              encoding_content[key] = EncodingObject.new(data)
            end
            @media_type_object[:encoding] = encoding_content
          else
            @media_type_object[:encoding] || openapi_data_at_media_type_object[:encoding]
          end
        end

        def have_patterned_content?(method_name)
          false
        end

        def patterned_object?
          false
        end

        private

        def openapi_data_at_media_type_object
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
