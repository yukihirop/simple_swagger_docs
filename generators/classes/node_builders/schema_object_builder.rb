#frozen_string_literal:true

require_relative 'base_object_builder'

module OpenapiObject
  module NodeBuilders
    class SchemaObjectBuilder < BaseObjectBuilder
      def have_schema_object?
        true
      end
    end
  end
end
