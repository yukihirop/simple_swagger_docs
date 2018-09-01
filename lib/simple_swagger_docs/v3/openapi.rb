#frozen_string_literal: true

module SimpleSwaggerDocs
  module V3
    module OpenAPI
      attr_accessor :openapi, :meta_api_setting_path

      def self.extended(base)
        base.send(:load_meta_api_setting)
      end

      def configure
        yield self
        load_meta_api_setting
      end

      def openapi
        ::Settings.openapi
      end

      def meta_api_setting_path
        File.expand_path('../config/meta_api_default_setting.yml', __FILE__)
      end

      private

      def load_meta_api_setting
        Config.load_and_set_settings(meta_api_setting_path)
      end
    end
  end
end
