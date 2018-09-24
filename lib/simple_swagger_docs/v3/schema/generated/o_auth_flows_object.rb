#frozen_string_literal:true

# Generated Date: 2018-09-25
# Template File:  generators/templates/class_generators/openapi_object_node_class_template.rb.erb
#
# This file was auto-generated by generators/tasks/generate.rb
#
# Please do not modify this file
# Please modify here: lib/simple_swagger_docs/v3/generators/schema

require_relative 'o_auth_flow_object'
require_relative '../node_updatable'
require_relative '../docs_methods'

module SimpleSwaggerDocs
  module V3
    module Schema
      class OAuthFlowsObject
        include NodeUpdatable
        include DocsMethods

        class << self
          def have_patterned_methods?
            false
          end
        end

        attr_accessor :implicit
        attr_accessor :password
        attr_accessor :clientCredentials
        attr_accessor :authorizationCode
        attr_accessor :o_auth_flows_object

        def initialize(openapi_data = {})
          check_initialize_args(openapi_data)

          @openapi_data = openapi_data
          @o_auth_flows_object ||= {
            implicit: nil,
            password: nil,
            clientCredentials: nil,
            authorizationCode: nil,
          }
          
        end
    
        def implicit
          if openapi_data_at_o_auth_flows_object&.fetch(:implicit, nil).is_a?(Hash)
            return @o_auth_flows_object[:implicit] unless @o_auth_flows_object[:implicit].nil?
            data = @openapi_data[:implicit]
            if OAuthFlowObject.have_patterned_methods?
              data = { implicit: data }
            end
            @o_auth_flows_object[:implicit] = OAuthFlowObject.new(data)
          else
            @o_auth_flows_object[:implicit] || openapi_data_at_o_auth_flows_object[:implicit]
          end
        end
    
        def password
          if openapi_data_at_o_auth_flows_object&.fetch(:password, nil).is_a?(Hash)
            return @o_auth_flows_object[:password] unless @o_auth_flows_object[:password].nil?
            data = @openapi_data[:password]
            if OAuthFlowObject.have_patterned_methods?
              data = { password: data }
            end
            @o_auth_flows_object[:password] = OAuthFlowObject.new(data)
          else
            @o_auth_flows_object[:password] || openapi_data_at_o_auth_flows_object[:password]
          end
        end
    
        def clientCredentials
          if openapi_data_at_o_auth_flows_object&.fetch(:clientCredentials, nil).is_a?(Hash)
            return @o_auth_flows_object[:clientCredentials] unless @o_auth_flows_object[:clientCredentials].nil?
            data = @openapi_data[:clientCredentials]
            if OAuthFlowObject.have_patterned_methods?
              data = { clientCredentials: data }
            end
            @o_auth_flows_object[:clientCredentials] = OAuthFlowObject.new(data)
          else
            @o_auth_flows_object[:clientCredentials] || openapi_data_at_o_auth_flows_object[:clientCredentials]
          end
        end
    
        def authorizationCode
          if openapi_data_at_o_auth_flows_object&.fetch(:authorizationCode, nil).is_a?(Hash)
            return @o_auth_flows_object[:authorizationCode] unless @o_auth_flows_object[:authorizationCode].nil?
            data = @openapi_data[:authorizationCode]
            if OAuthFlowObject.have_patterned_methods?
              data = { authorizationCode: data }
            end
            @o_auth_flows_object[:authorizationCode] = OAuthFlowObject.new(data)
          else
            @o_auth_flows_object[:authorizationCode] || openapi_data_at_o_auth_flows_object[:authorizationCode]
          end
        end

        def have_patterned_content?(method_name)
          false
        end

        def patterned_object?
          false
        end

        private

        def openapi_data_at_o_auth_flows_object
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