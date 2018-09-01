#frozen_string_literal:true

require_relative 'external_document'

module SimpleSwaggerDocs
  module V3
    module Tags
      attr_accessor :tags

      def tags
        ::Settings.tags.each_with_object([]) do |tag, data|
          external_docs_data = tag.externalDocs&.to_hash
          external_docs = external_docs_data.nil? ? nil : ExternalDocument.new(external_docs_data)
          data << Tag.new(name: tag.name, description: tag.description, external_docs: external_docs)
        end
      end

      private

      class Tag
        attr_accessor :name, :description, :external_docs

        def initialize(name:, description: nil, external_docs: nil)
          self.name          = name
          self.description   = description
          self.external_docs = external_docs
        end

        def external_docs
          @external_docs ||= ExternalDocument.new
        end
      end
    end
  end
end
