#frozen_string_literal:true

require_relative 'base_object_builder'

module OpenapiObject
  module NodeBuilders
    class PatternedObjectBuilder < BaseObjectBuilder
      def have_patterned_object?
        true
      end
    end
  end
end
