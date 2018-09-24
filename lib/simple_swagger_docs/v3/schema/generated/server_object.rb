#frozen_string_literal:true

# Generated Date: 2018-09-25
# Template File:  generators/templates/class_generators/openapi_object_node_class_template.rb.erb
#
# This file was auto-generated by generators/tasks/generate.rb
#
# Please do not modify this file
# Please modify here: lib/simple_swagger_docs/v3/generators/schema

require_relative 'server_variable_object'
require_relative '../node_updatable'
require_relative '../docs_methods'

module SimpleSwaggerDocs
  module V3
    module Schema
      class ServerObject
        include NodeUpdatable
        include DocsMethods

        class << self
          def have_patterned_methods?
            false
          end
        end

        attr_accessor :url
        attr_accessor :description
        attr_accessor :patterneds
        attr_accessor :server_object

        def initialize(openapi_data = {})
          check_initialize_args(openapi_data)

          self.url = openapi_data[:url]
          self.description = openapi_data[:description]
          @openapi_data = openapi_data
          @server_object ||= {
            url: nil,
            description: nil,
            patterneds: nil,
          }
          
        end
    
        def patterneds
          if openapi_data_at_server_object&.fetch(:patterneds, nil).is_a?(Hash)
            return @server_object[:patterneds] unless @server_object[:patterneds].nil?
            patterneds_content = {}
            openapi_data_at_server_object[:patterneds].each do |key, data|
              patterneds_content[key] = ServerVariableObject.new(data)
            end
            @server_object[:patterneds] = patterneds_content
          else
            @server_object[:patterneds] || openapi_data_at_server_object[:patterneds]
          end
        end

        def have_patterned_content?(method_name)
          false
        end

        def patterned_object?
          false
        end

        private

        def openapi_data_at_server_object
          if @openapi_data.is_a?(Hash)
            @openapi_data
          else
            raise
          end
        end

        def check_initialize_args(openapi_data)
          bad_args = []
          bad_args << :url if openapi_data[:url].nil?
          unless bad_args.empty?
            required_keys = bad_args.join(',')
            raise "initialize args: #{required_keys} is required."
          end
        end
      end
    end
  end
end
