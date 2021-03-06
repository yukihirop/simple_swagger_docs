#frozen_string_literal:true

# Generated Date: 2018-09-26
# Template File:  generators/templates/class_generators/openapi_object_node_class_template.rb.erb
#
# This file was auto-generated by generators/tasks/generate.rb
#
# Please do not modify this file
# Please modify here: lib/simple_swagger_docs/v2/generators/schema

require_relative 'patterned/name_patterned_object'
require_relative '../node_updatable'
require_relative '../docs_methods'

module SimpleSwaggerDocs
  module V2
    module Schema
      class SecurityRequirementObject
        include NodeUpdatable
        include DocsMethods

        class << self
          def have_patterned_methods?
            true
          end
        end

        attr_accessor :security
        attr_accessor :security_requirement_object

        def initialize(openapi_data = {})
          check_initialize_args(openapi_data)

          @openapi_data = openapi_data
          @security_requirement_object ||= {
            security: nil,
          }
          
        end
    
        def security
          if openapi_data_at_security_requirement_object&.fetch(:security, nil).is_a?(Hash)
            return @security_requirement_object[:security] unless @security_requirement_object[:security].nil?
            security_content = []
            openapi_data_at_security_requirement_object[:security].each do |key, value|
              data = { name: key, content: value }
              security_content << NamePatternedObject.new(data)
            end
            @security_requirement_object[:security] = security_content
          else
            @security_requirement_object[:security] || openapi_data_at_security_requirement_object[:security]
          end
        end

        def have_patterned_content?(method_name)
          [:security].include?(method_name)
        end

        def patterned_object?
          false
        end

        private

        def openapi_data_at_security_requirement_object
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
