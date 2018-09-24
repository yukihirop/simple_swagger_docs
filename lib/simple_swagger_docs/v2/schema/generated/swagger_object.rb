#frozen_string_literal:true

# Generated Date: 2018-09-25
# Template File:  generators/templates/class_generators/openapi_object_root_class_template.rb.erb
#
# This file was auto-generated by generators/tasks/generate.rb
#
# Please do not modify this file
# Please modify here: lib/simple_swagger_docs/v2/generators/schema

require_relative 'info_object'
require_relative 'paths_object'
require_relative 'definitions_object'
require_relative 'parameters_definitions_object'
require_relative 'responses_definitions_object'
require_relative 'security_definitions_object'
require_relative 'security_requirement_object'
require_relative 'tag_object'
require_relative 'external_documentation_object'
require_relative '../root_updatable'
require_relative '../docs_methods'

module SimpleSwaggerDocs
  module V2
    module Schema
      class SwaggerObject
        extend RootUpdatable
        extend DocsMethods
        
        class << self
          attr_accessor :swagger
          attr_accessor :info
          attr_accessor :host
          attr_accessor :basePath
          attr_accessor :schemes
          attr_accessor :consumes
          attr_accessor :produces
          attr_accessor :paths
          attr_accessor :definitions
          attr_accessor :parameters
          attr_accessor :responses
          attr_accessor :securityDefinitions
          attr_accessor :security
          attr_accessor :tags
          attr_accessor :externalDocs
          attr_accessor :swagger_object

          def build
            @swagger_object ||= {
              swagger: nil,
              info: nil,
              host: nil,
              basePath: nil,
              schemes: nil,
              consumes: nil,
              produces: nil,
              paths: nil,
              definitions: nil,
              parameters: nil,
              responses: nil,
              securityDefinitions: nil,
              security: nil,
              tags: nil,
              externalDocs: nil,
          }
          end
    
          def swagger
            return @swagger_object[:swagger] unless @swagger_object[:swagger].nil?
            @swagger_object[:swagger] ||= ::Settings.swagger
          end
    
          def info
            if @openapi_data&.fetch(:info, nil).is_a?(Hash)
              return @swagger_object[:info] unless @swagger_object[:info].nil?
              data = @openapi_data[:info]
              if InfoObject.have_patterned_methods?
                data = { info: data }
              end
              @swagger_object[:info] = InfoObject.new(data)
            else
              @swagger_object[:info]
            end
          end
    
          def paths
            if @openapi_data&.fetch(:paths, nil).is_a?(Hash)
              return @swagger_object[:paths] unless @swagger_object[:paths].nil?
              data = @openapi_data[:paths]
              if PathsObject.have_patterned_methods?
                data = { paths: data }
              end
              @swagger_object[:paths] = PathsObject.new(data)
            else
              @swagger_object[:paths]
            end
          end
    
          def definitions
            if @openapi_data&.fetch(:definitions, nil).is_a?(Hash)
              return @swagger_object[:definitions] unless @swagger_object[:definitions].nil?
              data = @openapi_data[:definitions]
              if DefinitionsObject.have_patterned_methods?
                data = { definitions: data }
              end
              @swagger_object[:definitions] = DefinitionsObject.new(data)
            else
              @swagger_object[:definitions]
            end
          end
    
          def parameters
            if @openapi_data&.fetch(:parameters, nil).is_a?(Hash)
              return @swagger_object[:parameters] unless @swagger_object[:parameters].nil?
              data = @openapi_data[:parameters]
              if ParametersDefinitionsObject.have_patterned_methods?
                data = { parameters: data }
              end
              @swagger_object[:parameters] = ParametersDefinitionsObject.new(data)
            else
              @swagger_object[:parameters]
            end
          end
    
          def responses
            if @openapi_data&.fetch(:responses, nil).is_a?(Hash)
              return @swagger_object[:responses] unless @swagger_object[:responses].nil?
              data = @openapi_data[:responses]
              if ResponsesDefinitionsObject.have_patterned_methods?
                data = { responses: data }
              end
              @swagger_object[:responses] = ResponsesDefinitionsObject.new(data)
            else
              @swagger_object[:responses]
            end
          end
    
          def securityDefinitions
            if @openapi_data&.fetch(:securityDefinitions, nil).is_a?(Hash)
              return @swagger_object[:securityDefinitions] unless @swagger_object[:securityDefinitions].nil?
              data = @openapi_data[:securityDefinitions]
              if SecurityDefinitionsObject.have_patterned_methods?
                data = { securityDefinitions: data }
              end
              @swagger_object[:securityDefinitions] = SecurityDefinitionsObject.new(data)
            else
              @swagger_object[:securityDefinitions]
            end
          end
    
          def security
            if @openapi_data&.fetch(:security, nil).is_a?(Array)
              return @swagger_object[:security] unless @swagger_object[:security].nil?
              security = []
              @openapi_data[:security].each do |data|
                security << SecurityRequirementObject.new(data)
              end
              @swagger_object[:security] = security
            else
              @swagger_object[:security]
            end
          end
    
          def tags
            if @openapi_data&.fetch(:tags, nil).is_a?(Array)
              return @swagger_object[:tags] unless @swagger_object[:tags].nil?
              tags = []
              @openapi_data[:tags].each do |data|
                tags << TagObject.new(data)
              end
              @swagger_object[:tags] = tags
            else
              @swagger_object[:tags]
            end
          end
    
          def externalDocs
            if @openapi_data&.fetch(:externalDocs, nil).is_a?(Hash)
              return @swagger_object[:externalDocs] unless @swagger_object[:externalDocs].nil?
              data = @openapi_data[:externalDocs]
              if ExternalDocumentationObject.have_patterned_methods?
                data = { externalDocs: data }
              end
              @swagger_object[:externalDocs] = ExternalDocumentationObject.new(data)
            else
              @swagger_object[:externalDocs]
            end
          end

          def have_patterned_content?(method_name)
            false
          end

          def patterned_object?
            false
          end
        end
      end
    end
  end
end
