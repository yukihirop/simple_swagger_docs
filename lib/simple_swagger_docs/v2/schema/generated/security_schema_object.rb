#frozen_string_literal:true

# Generated Date: 2018-09-25
# Template File:  generators/templates/class_generators/openapi_object_node_class_template.rb.erb
#
# This file was auto-generated by generators/tasks/generate.rb
#
# Please do not modify this file
# Please modify here: lib/simple_swagger_docs/v2/generators/schema

require_relative 'scopes_object'
require_relative '../node_updatable'
require_relative '../docs_methods'

module SimpleSwaggerDocs
  module V2
    module Schema
      class SecuritySchemaObject
        include NodeUpdatable
        include DocsMethods

        class << self
          def have_patterned_methods?
            false
          end
        end

        attr_accessor :type
        attr_accessor :description
        attr_accessor :name
        attr_accessor :_in
        attr_accessor :flow
        attr_accessor :authorizationUrl
        attr_accessor :tokenUrl
        attr_accessor :scopes
        attr_accessor :security_schema_object

        def initialize(openapi_data = {})
          check_initialize_args(openapi_data)

          self.type = openapi_data[:type]
          self.description = openapi_data[:description]
          self.name = openapi_data[:name]
          self._in = openapi_data[:_in]
          self.flow = openapi_data[:flow]
          self.authorizationUrl = openapi_data[:authorizationUrl]
          self.tokenUrl = openapi_data[:tokenUrl]
          @openapi_data = openapi_data
          @security_schema_object ||= {
            type: nil,
            description: nil,
            name: nil,
            _in: nil,
            flow: nil,
            authorizationUrl: nil,
            tokenUrl: nil,
            scopes: nil,
          }
          
        end
    
        def scopes
          if openapi_data_at_security_schema_object&.fetch(:scopes, nil).is_a?(Hash)
            return @security_schema_object[:scopes] unless @security_schema_object[:scopes].nil?
            data = @openapi_data[:scopes]
            if ScopesObject.have_patterned_methods?
              data = { scopes: data }
            end
            @security_schema_object[:scopes] = ScopesObject.new(data)
          else
            @security_schema_object[:scopes] || openapi_data_at_security_schema_object[:scopes]
          end
        end

        def have_patterned_content?(method_name)
          false
        end

        def patterned_object?
          false
        end

        private

        def openapi_data_at_security_schema_object
          if @openapi_data.is_a?(Hash)
            @openapi_data
          else
            raise
          end
        end

        def check_initialize_args(openapi_data)
          bad_args = []
          bad_args << :type if openapi_data[:type].nil?
          unless bad_args.empty?
            required_keys = bad_args.join(',')
            raise "initialize args: #{required_keys} is required."
          end
        end
      end
    end
  end
end