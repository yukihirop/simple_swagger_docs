#frozen_string_literal:true

require_relative '../../node_builders/node_object_builder'
require_relative '../../filepath_methods'

module OpenapiObject
  module CherryObject
    class ClassGenerator
      include ConfigMethods
      include FilePathMethods

      attr_accessor :schema_object_name, :class_name, :schema_version, :schema_relative_dirdepth

      def initialize(schema_info)
        self.schema_object_name       = schema_info.object_name
        self.class_name               = schema_info.object_name.camelize
        self.schema_version           = schema_info.version
        self.schema_relative_dirdepth = schema_info.relative_dirdepth
      end

      def require_contents
        all_schema_object_class.map do |schema_object|
          node_object_builder = create_node_object_builder(schema_object.underscore)
          relative_filepath   = relative_filepath(node_object_builder.filepath, filepath)
          node_object_builder_filename = node_object_builder.file_name
          if relative_filepath == '.'
            node_object_builder_filename
          else
            "#{relative_filepath}/#{node_object_builder_filename}"
          end
        end.uniq
      end

      def default_class
        is_default_class = proc {|schema_object| schema_object_default_class?(schema_object) }
        all_schema_object_class.select(&is_default_class)[0]
      end

      def alternate_class
        is_alternate_class = proc {|schema_object| !schema_object_default_class?(schema_object) }
        all_schema_object_class.select(&is_alternate_class)[0]
      end

      private

      def all_schema_object_class
        openapi_object_nodes.keys.map(&:to_s)
      end

      def filepath
        openapi_object_filepath.to_s
      end

      def create_node_object_builder(node_object_name)
        OpenapiObject::NodeBuilders::NodeObjectBuilder.build(node_object_name)
      end
    end
  end
end
