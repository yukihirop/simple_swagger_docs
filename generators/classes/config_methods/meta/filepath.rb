#frozen_string_litera:true

module OpenapiObject
  module ConfigMethods
    module Meta
      module FilePath
        private

        def openapi_object_filepath
          openapi_object_meta.filepath
        rescue => e
          raise "[DevelopmentError] Please Set the instance patterned: 'schema_object_name' to self."
        end
        alias_method :include_module_openapi_object_filepath, :openapi_object_filepath
      end
    end
  end
end
