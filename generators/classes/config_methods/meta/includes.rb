#frozen_string_litera:true

module OpenapiObject
  module ConfigMethods
    module Meta
      module Includes
        private

        def openapi_object_meta_includes
          openapi_object_meta&.includes || []
        end
      end
    end
  end
end
