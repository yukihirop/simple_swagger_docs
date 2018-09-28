#frozen_string_literal:true

require 'pry'

module YamlRouter
  module Nodes
    module Statable
      def node_value?(target)
        target.is_a?(Integer) || target.is_a?(TrueClass) || target.is_a?(FalseClass)
      end

      def node_cherry_object?(target)
        !!target.match(/CherryObject/)
      end

      def node_object?(target)
        !!target.match(/Object/)
      end
    end
  end
end