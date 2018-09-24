#frozen_string_literal:true

# Generated Date: 2018-09-25
# Template File:  generators/templates/class_generators/patterned_object_node_class_template.rb.erb
#
# This file was auto-generated by generators/tasks/generate.rb
#
# Please do not modify this file
# Please modify here: lib/simple_swagger_docs/v2/generators/schema/patterned

require_relative '../../response_object'
require_relative '../../../node_updatable'
require_relative '../../../docs_methods'

module SimpleSwaggerDocs
  module V2
    module Schema
      class NameResponseObjectPatternedObject
        include NodeUpdatable
        include DocsMethods

        attr_accessor :name
        attr_accessor :content
        attr_accessor :name_response_object_patterned_object

        def initialize(openapi_data = {})
          check_initialize_args(openapi_data)
          self.name = openapi_data[:name]
          @openapi_data = openapi_data
          @name_response_object_patterned_object ||= {
            name: nil,
            content: nil,
        }
        end
    
        def content
          if openapi_data_at_name_response_object_patterned_object&.fetch(:content, nil).is_a?(Hash)
            return @name_response_object_patterned_object[:content] unless @name_response_object_patterned_object[:content].nil?
            data = @openapi_data[:content]
            if ResponseObject.have_patterned_methods?
              data = { content: data }
            end
            @name_response_object_patterned_object[:content] = ResponseObject.new(data)
          else
            @name_response_object_patterned_object[:content] || openapi_data_at_name_response_object_patterned_object[:content]
          end
        end

        def patterned_object?
          true
        end

        private

        def openapi_data_at_name_response_object_patterned_object
          if @openapi_data.is_a?(Hash)
            @openapi_data
          else
            raise
          end
        end

        def check_initialize_args(openapi_data)
          bad_args = []
          bad_args << :name if openapi_data[:name].nil?
          bad_args << :content if openapi_data[:content].nil?
          unless bad_args.empty?
            required_keys = bad_args.join(',')
            raise "initialize args: #{required_keys} is required."
          end
        end
      end
    end
  end
end
