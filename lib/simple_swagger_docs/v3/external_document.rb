#frozen_string_literal:true
module SimpleSwaggerDocs
  module V3
    class ExternalDocument
      attr_accessor :description, :url

      def initialize(description: nil, url:)
        self.description = description
        self.url         = url
      end
    end
  end
end
