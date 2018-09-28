# frozen_string_literal: true

require_relative 'flatten'
require_relative 'configration'

module YamlRouter
  
  class Searcher
    extended Configration

    class << self
      def search(word)
        repository.select { |key, _| key.to_s.match?(word) }
      end

      private

      def repository
        data = ::Settings.to_hash
        flatten_definitions(data, nil, false)
      end
    end
  end
end