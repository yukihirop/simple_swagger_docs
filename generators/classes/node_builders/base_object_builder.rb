#frozen_string_literal:true

require_relative '../config_methods'

module OpenapiObject
  module NodeBuilders
    class BaseObjectBuilder
      include ConfigMethods

      attr_accessor :schema_object_name

      def initialize(schema_object_name)
        self.schema_object_name = schema_object_name
      end

      def filepath
        openapi_object_filepath.to_s
      end

      def file_name
        schema_object_name
      end
      alias_method :node_file_name, :file_name

      def have_node_object?
        true
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
