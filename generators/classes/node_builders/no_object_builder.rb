#frozen_string_literal:true

require_relative '../config_methods'

module OpenapiObject
  module NodeBuilders
    class NoObjectBuilder
      include ConfigMethods

      def filepath
        '.'
      end

      def file_name
        nil
      end
      alias_method :node_file_name, :file_name

      def have_node_object?
        false
      end

      def have_cherry_object?
        false
      end

      def have_patterned_object?
        false
      end

      def have_schema_object?
        false
      end
    end
  end
end
