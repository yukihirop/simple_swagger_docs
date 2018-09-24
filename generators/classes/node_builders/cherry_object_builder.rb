#frozen_string_literal:true

require_relative 'base_object_builder'

module OpenapiObject
  module NodeBuilders
    class CherryObjectBuilder < BaseObjectBuilder
      def have_cherry_object?
        true
      end
    end
  end
end
