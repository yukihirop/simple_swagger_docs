module OpenapiObject
  module V2
    module ConfigMethods
      def v2_use_config?
        judge_from_schema = case schema_object_name
                            when 'info_object' || 'contact_object' || 'license_object'
                        true
                            else
                        false
                      end
        if schema_object_name == 'swagger_object' && method_name_at_schema == :swagger
          true
        else
          judge_from_schema && !have_node_object?
        end
      end
    end
  end
end
