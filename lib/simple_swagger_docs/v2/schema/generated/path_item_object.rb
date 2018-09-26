#frozen_string_literal:true

# Generated Date: 2018-09-26
# Template File:  generators/templates/class_generators/openapi_object_node_class_template.rb.erb
#
# This file was auto-generated by generators/tasks/generate.rb
#
# Please do not modify this file
# Please modify here: lib/simple_swagger_docs/v2/generators/schema

require_relative 'operation_object'
require_relative 'cherry/parameter_cherry_object'
require_relative '../node_updatable'
require_relative '../docs_methods'

module SimpleSwaggerDocs
  module V2
    module Schema
      class PathItemObject
        include NodeUpdatable
        include DocsMethods

        class << self
          def have_patterned_methods?
            false
          end
        end

        attr_accessor :_ref
        attr_accessor :get
        attr_accessor :put
        attr_accessor :post
        attr_accessor :delete
        attr_accessor :options
        attr_accessor :head
        attr_accessor :patch
        attr_accessor :parameters
        attr_accessor :path_item_object

        def initialize(openapi_data = {})
          check_initialize_args(openapi_data)

          self._ref = openapi_data[:_ref]
          @openapi_data = openapi_data
          @path_item_object ||= {
            _ref: nil,
            get: nil,
            put: nil,
            post: nil,
            delete: nil,
            options: nil,
            head: nil,
            patch: nil,
            parameters: nil,
          }
          
        end
    
        def get
          if openapi_data_at_path_item_object&.fetch(:get, nil).is_a?(Hash)
            return @path_item_object[:get] unless @path_item_object[:get].nil?
            data = @openapi_data[:get]
            if OperationObject.have_patterned_methods?
              data = { get: data }
            end
            @path_item_object[:get] = OperationObject.new(data)
          else
            @path_item_object[:get] || openapi_data_at_path_item_object[:get]
          end
        end
    
        def put
          if openapi_data_at_path_item_object&.fetch(:put, nil).is_a?(Hash)
            return @path_item_object[:put] unless @path_item_object[:put].nil?
            data = @openapi_data[:put]
            if OperationObject.have_patterned_methods?
              data = { put: data }
            end
            @path_item_object[:put] = OperationObject.new(data)
          else
            @path_item_object[:put] || openapi_data_at_path_item_object[:put]
          end
        end
    
        def post
          if openapi_data_at_path_item_object&.fetch(:post, nil).is_a?(Hash)
            return @path_item_object[:post] unless @path_item_object[:post].nil?
            data = @openapi_data[:post]
            if OperationObject.have_patterned_methods?
              data = { post: data }
            end
            @path_item_object[:post] = OperationObject.new(data)
          else
            @path_item_object[:post] || openapi_data_at_path_item_object[:post]
          end
        end
    
        def delete
          if openapi_data_at_path_item_object&.fetch(:delete, nil).is_a?(Hash)
            return @path_item_object[:delete] unless @path_item_object[:delete].nil?
            data = @openapi_data[:delete]
            if OperationObject.have_patterned_methods?
              data = { delete: data }
            end
            @path_item_object[:delete] = OperationObject.new(data)
          else
            @path_item_object[:delete] || openapi_data_at_path_item_object[:delete]
          end
        end
    
        def options
          if openapi_data_at_path_item_object&.fetch(:options, nil).is_a?(Hash)
            return @path_item_object[:options] unless @path_item_object[:options].nil?
            data = @openapi_data[:options]
            if OperationObject.have_patterned_methods?
              data = { options: data }
            end
            @path_item_object[:options] = OperationObject.new(data)
          else
            @path_item_object[:options] || openapi_data_at_path_item_object[:options]
          end
        end
    
        def head
          if openapi_data_at_path_item_object&.fetch(:head, nil).is_a?(Hash)
            return @path_item_object[:head] unless @path_item_object[:head].nil?
            data = @openapi_data[:head]
            if OperationObject.have_patterned_methods?
              data = { head: data }
            end
            @path_item_object[:head] = OperationObject.new(data)
          else
            @path_item_object[:head] || openapi_data_at_path_item_object[:head]
          end
        end
    
        def patch
          if openapi_data_at_path_item_object&.fetch(:patch, nil).is_a?(Hash)
            return @path_item_object[:patch] unless @path_item_object[:patch].nil?
            data = @openapi_data[:patch]
            if OperationObject.have_patterned_methods?
              data = { patch: data }
            end
            @path_item_object[:patch] = OperationObject.new(data)
          else
            @path_item_object[:patch] || openapi_data_at_path_item_object[:patch]
          end
        end
    
        def parameters
          if openapi_data_at_path_item_object&.fetch(:parameters, nil).is_a?(Array)
            return @path_item_object[:parameters] unless @path_item_object[:parameters].nil?
            parameters_content = []
            openapi_data_at_path_item_object[:parameters].each do |data|
              if ParameterCherryObject.have_patterned_methods?
                data = { parameters: data }
              end
              parameters_content << ParameterCherryObject.build(data)
            end
            @path_item_object[:parameters] = parameters_content
          else
            @path_item_object[:parameters] || openapi_data_at_path_item_object[:parameters]
          end
        end

        def have_patterned_content?(method_name)
          false
        end

        def patterned_object?
          false
        end

        private

        def openapi_data_at_path_item_object
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
