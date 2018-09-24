module OpenapiObject
  module V3
    module ConfigMethods
      def v3_use_config?
        judge_from_schema = case schema_object_name
                            when 'info_object' || 'contact_object' || 'license_object'
                        true
                            else
                        false
                      end
        if schema_object_name == 'openapi_object' && method_name_at_schema == :openapi
          true
        else
          judge_from_schema && !have_node_object?
        end
      end
    end
  end
end
