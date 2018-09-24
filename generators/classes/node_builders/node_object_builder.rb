#frozen_string_literal:true

require_relative 'base_object_builder'
require_relative 'patterned_object_builder'
require_relative 'cherry_object_builder'
require_relative 'schema_object_builder'
require_relative 'no_object_builder'

module OpenapiObject
  module NodeBuilders
    class NodeObjectBuilder < BaseObjectBuilder
      def self.build(node_object_name)
        if node_object_name.match(/patterned_object/)
          PatternedObjectBuilder.new(node_object_name)
        elsif node_object_name.match(/cherry_object/)
          CherryObjectBuilder.new(node_object_name)
        elsif node_object_name.match(/object/)
          SchemaObjectBuilder.new(node_object_name)
        else
          NoObjectBuilder.new
        end
      end
    end
  end
end
