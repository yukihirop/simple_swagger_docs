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
      class ContactObject
        include NodeUpdatable
        include DocsMethods

        class << self
          def have_patterned_methods?
            false
          end
        end

        attr_accessor :name
        attr_accessor :url
        attr_accessor :email
        attr_accessor :contact_object

        def initialize(openapi_data = {})
          check_initialize_args(openapi_data)

          self.name = openapi_data[:name]
          self.url = openapi_data[:url]
          self.email = openapi_data[:email]
          @openapi_data = openapi_data
          @contact_object ||= {
            name: nil,
            url: nil,
            email: nil,
          }
          
        end

        def have_patterned_content?(method_name)
          false
        end

        def patterned_object?
          false
        end

        private

        def openapi_data_at_contact_object
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