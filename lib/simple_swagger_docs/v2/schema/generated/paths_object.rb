#frozen_string_literal:true

# Generated Date: 2018-09-26
# Template File:  generators/templates/class_generators/openapi_object_node_class_template.rb.erb
#
# This file was auto-generated by generators/tasks/generate.rb
#
# Please do not modify this file
# Please modify here: lib/simple_swagger_docs/v2/generators/schema

require_relative 'patterned/path_patterned_object'
require_relative '../node_updatable'
require_relative '../docs_methods'

module SimpleSwaggerDocs
  module V2
    module Schema
      class PathsObject
        include NodeUpdatable
        include DocsMethods

        class << self
          def have_patterned_methods?
            true
          end
        end

        attr_accessor :paths
        attr_accessor :paths_object

        def initialize(openapi_data = {})
          check_initialize_args(openapi_data)

          @openapi_data = openapi_data
          @paths_object ||= {
            paths: nil,
          }
          
        end
    
        def paths
          if openapi_data_at_paths_object&.fetch(:paths, nil).is_a?(Hash)
            return @paths_object[:paths] unless @paths_object[:paths].nil?
            paths_content = []
            openapi_data_at_paths_object[:paths].each do |key, value|
              data = { name: key, content: value }
              paths_content << PathPatternedObject.new(data)
            end
            @paths_object[:paths] = paths_content
          else
            @paths_object[:paths] || openapi_data_at_paths_object[:paths]
          end
        end

        def have_patterned_content?(method_name)
          [:paths].include?(method_name)
        end

        def patterned_object?
          false
        end

        private

        def openapi_data_at_paths_object
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
