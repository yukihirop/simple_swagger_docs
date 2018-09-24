#frozen_string_litera:true

require_relative 'config_methods/meta'
require_relative 'config_methods/fixed_fields'
require_relative 'config_methods/nodes'
require_relative 'v2/config_methods'
require_relative 'v3/config_methods'

module OpenapiObject
  module ConfigMethods
    include Meta
    include FixedFields
    include Nodes
    include OpenapiObject::V2::ConfigMethods
    include OpenapiObject::V3::ConfigMethods

    def use_config?
      case schema_version
      when 'v3'
        v3_use_config?
      when 'v2'
        v2_use_config?
      end
    end
    alias_method :use_config, :use_config?

    private

    def remove_object(name)
      name.gsub('_object', '')
    end
  end
end
