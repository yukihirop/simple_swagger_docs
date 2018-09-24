#frozen_string_literal:true

# Generated Date: 2018-09-25
# Template File:  generators/templates/class_generators/openapi_object_node_class_template.rb.erb
#
# This file was auto-generated by generators/tasks/generate.rb
#
# Please do not modify this file
# Please modify here: lib/simple_swagger_docs/v2/generators/schema

require_relative 'contact_object'
require_relative 'license_object'
require_relative '../node_updatable'
require_relative '../docs_methods'

module SimpleSwaggerDocs
  module V2
    module Schema
      class InfoObject
        include NodeUpdatable
        include DocsMethods

        class << self
          def have_patterned_methods?
            false
          end
        end

        attr_accessor :title
        attr_accessor :description
        attr_accessor :termsOfService
        attr_accessor :contact
        attr_accessor :license
        attr_accessor :version
        attr_accessor :info_object

        def initialize(openapi_data = {})
          check_initialize_args(openapi_data)

          @openapi_data = openapi_data
          @info_object ||= {
            title: nil,
            description: nil,
            termsOfService: nil,
            contact: nil,
            license: nil,
            version: nil,
          }
          
        end
    
        def title
          return @info_object[:title] unless @info_object[:title].nil?
          @info_object[:title] ||= ::Settings.info.title
        end
    
        def description
          return @info_object[:description] unless @info_object[:description].nil?
          @info_object[:description] ||= ::Settings.info.description
        end
    
        def termsOfService
          return @info_object[:termsOfService] unless @info_object[:termsOfService].nil?
          @info_object[:termsOfService] ||= ::Settings.info.termsOfService
        end
    
        def contact
          if openapi_data_at_info_object&.fetch(:contact, nil).is_a?(Hash)
            return @info_object[:contact] unless @info_object[:contact].nil?
            data = @openapi_data[:contact]
            if ContactObject.have_patterned_methods?
              data = { contact: data }
            end
            @info_object[:contact] = ContactObject.new(data)
          else
            @info_object[:contact] || openapi_data_at_info_object[:contact]
          end
        end
    
        def license
          if openapi_data_at_info_object&.fetch(:license, nil).is_a?(Hash)
            return @info_object[:license] unless @info_object[:license].nil?
            data = @openapi_data[:license]
            if LicenseObject.have_patterned_methods?
              data = { license: data }
            end
            @info_object[:license] = LicenseObject.new(data)
          else
            @info_object[:license] || openapi_data_at_info_object[:license]
          end
        end
    
        def version
          return @info_object[:version] unless @info_object[:version].nil?
          @info_object[:version] ||= ::Settings.info.version
        end

        def have_patterned_content?(method_name)
          false
        end

        def patterned_object?
          false
        end

        private

        def openapi_data_at_info_object
          if @openapi_data.is_a?(Hash)
            @openapi_data
          else
            raise
          end
        end

        def check_initialize_args(openapi_data)
          bad_args = []
          bad_args << :title if openapi_data[:title].nil?
          unless bad_args.empty?
            required_keys = bad_args.join(',')
            raise "initialize args: #{required_keys} is required."
          end
        end
      end
    end
  end
end
