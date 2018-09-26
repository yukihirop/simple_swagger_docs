#frozen_string_literal:true

# Generated Date: 2018-09-26
# Template File:  generators/templates/class_generators/openapi_object_node_class_template.rb.erb
#
# This file was auto-generated by generators/tasks/generate.rb
#
# Please do not modify this file
# Please modify here: lib/simple_swagger_docs/v3/generators/schema

require_relative 'cherry/header_cherry_object'
require_relative 'media_type_object'
require_relative 'cherry/link_cherry_object'
require_relative '../node_updatable'
require_relative '../docs_methods'

module SimpleSwaggerDocs
  module V3
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
        attr_accessor :headers
        attr_accessor :content
        attr_accessor :links
        attr_accessor :response_object

        def initialize(openapi_data = {})
          check_initialize_args(openapi_data)

          self.description = openapi_data[:description]
          @openapi_data = openapi_data
          @response_object ||= {
            description: nil,
            headers: nil,
            content: nil,
            links: nil,
          }
          
        end
    
        def headers
          if openapi_data_at_response_object&.fetch(:headers, nil).is_a?(Hash)
            return @response_object[:headers] unless @response_object[:headers].nil?
            headers_content = {}
            openapi_data_at_response_object[:headers].each do |key, data|
              headers_content[key] = HeaderCherryObject.build(data)
            end
            @response_object[:headers] = headers_content
          else
            @response_object[:headers] || openapi_data_at_response_object[:headers]
          end
        end
    
        def content
          if openapi_data_at_response_object&.fetch(:content, nil).is_a?(Hash)
            return @response_object[:content] unless @response_object[:content].nil?
            content_content = {}
            openapi_data_at_response_object[:content].each do |key, data|
              content_content[key] = MediaTypeObject.new(data)
            end
            @response_object[:content] = content_content
          else
            @response_object[:content] || openapi_data_at_response_object[:content]
          end
        end
    
        def links
          if openapi_data_at_response_object&.fetch(:links, nil).is_a?(Hash)
            return @response_object[:links] unless @response_object[:links].nil?
            links_content = {}
            openapi_data_at_response_object[:links].each do |key, data|
              links_content[key] = LinkCherryObject.build(data)
            end
            @response_object[:links] = links_content
          else
            @response_object[:links] || openapi_data_at_response_object[:links]
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
