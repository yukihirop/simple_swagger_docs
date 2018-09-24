#frozen_string_litera:true

module OpenapiObject
  module ConfigMethods
    module FixedFields
      def method_name_at_schema_patterned?
        openapi_object_method&.public_send(:patterned) == true
      end

      def required?
        openapi_object_method&.public_send(:required) == true
      end

      def dependented?
        openapi_object_method&.public_send(:dependented) == true
      end

      private

      def openapi_object_fixed_fields
        ::Settings.public_send(:"#{schema_object_name.camelize}").fixed_fields
      rescue => e
        raise "[DevelopmentError] Please Set the instance patterned: 'schema_object_name' to self."
      end
      alias_method :include_module_openapi_object_fixed_fields, :openapi_object_fixed_fields

      def openapi_object_method(method_name = method_name_at_schema)
        openapi_object_fixed_fields.public_send(method_name)
      rescue => e
        raise "[DevelopmentError] Please Set the instance patterned: 'method_name_at_schema' to self."
      end

      def openapi_object_method_type
        if dependented?
          dependent_method_name = openapi_object_method.public_send(:type)
          openapi_object_method(dependent_method_name).public_send(:type)
        else
          openapi_object_method.public_send(:type)
        end
      end
    end
  end
end
