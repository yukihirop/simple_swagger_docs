#frozen_string_litera:true

require_relative 'meta/includes'
require_relative 'meta/filepath'

module OpenapiObject
  module ConfigMethods
    module Meta
      include Includes
      include FilePath

      private

      def root_schema_object_name?
        openapi_object_meta&.root == true
      end

      def openapi_object_meta
        ::Settings.public_send(:"#{schema_object_name.camelize}").meta
      rescue => e
        raise "[DevelopmentError] Please Set the instance patterned: 'schema_object_name' to self."
      end
    end
  end
end
