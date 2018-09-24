#frozen_string_litera:true

module OpenapiObject
  module ConfigMethods
    module Nodes
      def schema_object_default_class?(schema_object)
        openapi_object_nodes_schema_object(schema_object)&.public_send(:default) == true
      end

      private

      def openapi_object_nodes
        ::Settings.public_send(:"#{schema_object_name.camelize}").nodes
      rescue => e
        raise "[DevelopmentError] Please Set the instance patterned: 'schema_object_name' to self."
      end

      def openapi_object_nodes_schema_object(schema_object)
        openapi_object_nodes.public_send(:"#{schema_object}")
      end
    end
  end
end
