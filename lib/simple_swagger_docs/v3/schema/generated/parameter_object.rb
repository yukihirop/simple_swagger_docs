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
require_relative 'media_type_object'
require_relative '../node_updatable'
require_relative '../docs_methods'

module SimpleSwaggerDocs
  module V3
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
        attr_accessor :deprecated
        attr_accessor :allowEmptyValue
        attr_accessor :style
        attr_accessor :explode
        attr_accessor :allowReserved
        attr_accessor :schema
        attr_accessor :example
        attr_accessor :examples
        attr_accessor :content
        attr_accessor :parameter_object

        def initialize(openapi_data = {})
          check_initialize_args(openapi_data)

          self.name = openapi_data[:name]
          self._in = openapi_data[:_in]
          self.description = openapi_data[:description]
          self.required = openapi_data[:required]
          self.deprecated = openapi_data[:deprecated]
          self.allowEmptyValue = openapi_data[:allowEmptyValue]
          self.style = openapi_data[:style]
          self.explode = openapi_data[:explode]
          self.allowReserved = openapi_data[:allowReserved]
          self.example = openapi_data[:example]
          @openapi_data = openapi_data
          @parameter_object ||= {
            name: nil,
            _in: nil,
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
          if openapi_data_at_parameter_object&.fetch(:schema, nil).is_a?(Hash)
            return @parameter_object[:schema] unless @parameter_object[:schema].nil?
            data = @openapi_data[:schema]
            if SchemaCherryObject.have_patterned_methods?
              data = { schema: data }
            end
            @parameter_object[:schema] = SchemaCherryObject.build(data)
          else
            @parameter_object[:schema] || openapi_data_at_parameter_object[:schema]
          end
        end
    
        def examples
          if openapi_data_at_parameter_object&.fetch(:examples, nil).is_a?(Hash)
            return @parameter_object[:examples] unless @parameter_object[:examples].nil?
            examples_content = {}
            openapi_data_at_parameter_object[:examples].each do |key, data|
              examples_content[key] = ExampleCherryObject.build(data)
            end
            @parameter_object[:examples] = examples_content
          else
            @parameter_object[:examples] || openapi_data_at_parameter_object[:examples]
          end
        end
    
        def content
          if openapi_data_at_parameter_object&.fetch(:content, nil).is_a?(Hash)
            return @parameter_object[:content] unless @parameter_object[:content].nil?
            content_content = {}
            openapi_data_at_parameter_object[:content].each do |key, data|
              content_content[key] = MediaTypeObject.new(data)
            end
            @parameter_object[:content] = content_content
          else
            @parameter_object[:content] || openapi_data_at_parameter_object[:content]
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
          bad_args << :name if openapi_data[:name].nil?
          bad_args << :_in if openapi_data[:_in].nil?
          unless bad_args.empty?
            required_keys = bad_args.join(',')
            raise "initialize args: #{required_keys} is required."
          end
        end
      end
    end
  end
end