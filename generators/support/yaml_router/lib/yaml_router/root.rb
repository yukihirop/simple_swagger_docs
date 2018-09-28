#frozen_string_literal:true

require 'config'
require 'pry'
require_relative 'fixed_field'
require_relative 'node'
require_relative 'nodes/creatable'

module YamlRouter
  class Root
    extend Statable
    extend Nodes::Creatable

    class << self
      def route_list(root_object)
        create_router(root_object)
        root_keys.each do |key|
          build_object_or_value(key)

          if config_options?
            @router[key] << key
            @router[key] << FixedField.new(@object_or_value).route_list
          else
            if value?
              @router[key] << key
              @router[key] << @object_or_value
            elsif array?
              node_name = @object_or_value.first
              @router[key] << key
              @router[key] << node_name
              @router[key] << create_node(node_name)
            elsif hash?
              node_name = @object_or_value[:value]
              @router[key] << key
              @router[key] << node_name
              @router[key] << create_node(node_name)
            elsif cherry_object?
              #
            elsif object?
              @router[key] << key
              @router[key] << @object_or_value
              @router[key] << Node.new(@object_or_value).route_list
            else
              @router[key] << key
              @router[key] << @object_or_value
            end
          end
        end
        @router
      end

      def load_and_set_settings(paths)
        ::Config.load_and_set_settings(paths)
      end

      private

      def settings
        ::Settings.public_send(@root_object).fixed_fields
      end

      def root_keys
        settings.keys
      end

      def create_router(root_object)
        @root_object = root_object
        @router ||= {}
        root_keys.each { |key| @router[key] ||= [] }
      end

      def build_object_or_value(key)
        @object_or_value = settings.public_send(key)
      end
    end
  end
end