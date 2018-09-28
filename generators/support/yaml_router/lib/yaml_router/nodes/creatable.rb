#frozen_string_literal:true

require 'config'
require 'pry'

require_relative 'statable'
require_relative '../node'

module YamlRouter
  module Nodes
    module Creatable
      include Statable

      def create_node(node_name)
        if node_cherry_object?(node_name)
        elsif node_object?(node_name)
          Node.new(node_name).route_list
        elsif node_value?(node_name)
          node_name
        end
      end
    end
  end
end