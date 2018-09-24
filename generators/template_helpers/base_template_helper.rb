#frozen_string_literal:true

require_relative '../classes/config_methods'
require 'active_support'
require 'active_support/core_ext'

# Scope: OpenapiObject::MethodGenerator
module OpenapiObject
  class BaseTemplateHelper
    include ConfigMethods
    extend Forwardable
    
    attr_accessor :schema_name, :schema_object_name, :method_name_at_schema, :use_config, :node_object_builder
    def_delegators :@node_object_builder, :have_node_object?, :have_patterned_object?, :have_cherry_object?, :have_schema_object?
    def_delegators :@method_content_generator, :schema_name, :schema_object_name, :schema_version, :method_name_at_schema, :use_config?
    
    def initialize(method_content_generator, node_object_builder = nil, included_class_instance = nil)
      @method_content_generator = method_content_generator
      @node_object_builder      = node_object_builder
    end

    def method_signature
      method_name_at_schema
    end

    def method_content
      template_path = File.expand_path method_content_template_path, root
      eruby = SimpleSwaggerDocs::Eruby.new(File.read(template_path), trim: true)
      eruby.result(binding)
    end

    def build_method
      case
      when have_schema_object?
        :new
      when have_cherry_object?
        :build
      else
        :new
      end
    end

    def openapi_data_at_schema_object
      "openapi_data_at_#{schema_object_name}"
    end

    private

    def node_class_name
      @node_object_builder&.file_name&.camelize
    end

    def method_content_template_path
      module_or_class = self.class.to_s.split('::').map(&:underscore)
      generators_name = module_or_class[1]
      node_or_root    = module_or_class[2]
      filename        = module_or_class[3].gsub('_helper','')
      "generators/templates/#{generators_name}/#{node_or_root}/method_content/#{filename}.rb.erb"
    end
  end
end
