# frozen_string_literal: true

require_relative 'config'

module YamlRouter
  module Configration
    DEFAULT_YAML_PATHS = ''.freeze

    VALID_OPTIONS_KEYS = [
      :yaml_paths
    ]

    def self.extended(base)
      base.set_default
      base.load_and_set_settings
    end

    private

    def repository
      ::Settings.to_hash
    end

    def load_and_set_settings
      Config.load_and_set_settings(yaml_paths)
    end

    def set_default
      self.yaml_paths = DEFAULT_YAML_PATHS
    end
  end
end
