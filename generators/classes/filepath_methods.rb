#frozen_string_literal:true

require_relative 'config_methods'

module OpenapiObject
  module FilePathMethods
    include ConfigMethods

    private

    def relative_filepath(from, to)
      Pathname(from).relative_path_from(Pathname(to)).to_s
    end
  end
end
