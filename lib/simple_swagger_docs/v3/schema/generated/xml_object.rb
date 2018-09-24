#frozen_string_literal:true

# Generated Date: 2018-09-25
# Template File:  generators/templates/class_generators/openapi_object_node_class_template.rb.erb
#
# This file was auto-generated by generators/tasks/generate.rb
#
# Please do not modify this file
# Please modify here: lib/simple_swagger_docs/v3/generators/schema

require_relative '../node_updatable'
require_relative '../docs_methods'

module SimpleSwaggerDocs
  module V3
    module Schema
      class XmlObject
        include NodeUpdatable
        include DocsMethods

        class << self
          def have_patterned_methods?
            false
          end
        end

        attr_accessor :name
        attr_accessor :namespace
        attr_accessor :prefix
        attr_accessor :attribute
        attr_accessor :wrapped
        attr_accessor :xml_object

        def initialize(openapi_data = {})
          check_initialize_args(openapi_data)

          self.name = openapi_data[:name]
          self.namespace = openapi_data[:namespace]
          self.prefix = openapi_data[:prefix]
          self.attribute = openapi_data[:attribute]
          self.wrapped = openapi_data[:wrapped]
          @openapi_data = openapi_data
          @xml_object ||= {
            name: nil,
            namespace: nil,
            prefix: nil,
            attribute: nil,
            wrapped: nil,
          }
          
        end

        def have_patterned_content?(method_name)
          false
        end

        def patterned_object?
          false
        end

        private

        def openapi_data_at_xml_object
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
