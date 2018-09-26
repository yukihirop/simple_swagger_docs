#frozen_string_literal:true

# Generated Date: 2018-09-26
# Template File:  generators/templates/class_generators/cherry_object_node_class_template.rb.erb
#
# This file was auto-generated by generators/tasks/generate.rb
#
# Please do not modify this file
# Please modify here: lib/simple_swagger_docs/v3/generators/schema/cherry

require_relative '../request_body_object'
require_relative '../reference_object'

module SimpleSwaggerDocs
  module V3
    module Schema
      class RequestBodyCherryObject
        class << self
          def build(openapi_data)
            @openapi_data = openapi_data
            if Set[*default_class_fields].intersect?(Set[*openapi_data.keys])
              default_class.new(openapi_data)
            else
              alternate_class.new(openapi_data)
            end
          end

          def have_patterned_methods?
            false
          end

          private

          def default_class
            RequestBodyObject
          end

          def alternate_class
            ReferenceObject
          end

          def default_class_fields
            default_class.instance_methods
          end
        end
      end
    end
  end
end
