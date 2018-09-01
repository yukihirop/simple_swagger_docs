#frozen_string_literal:true

module SimpleSwaggerDocs
  module V3
    module Info
      attr_accessor :info

      def info
        Info
      end

      private

      class Info
        class << self
          attr_accessor :title, :description, :terms_of_service, :version, :contact, :license

          def title
            ::Settings.info.title
          end

          def description
            ::Settings.info.description
          end

          def terms_of_service
            ::Settings.info.termsOfService
          end

          def version
            ::Settings.info.version
          end

          def contact
            Contact
          end

          def license
            License
          end
        end
      end

      class Contact
        class << self
          attr_accessor :name, :url, :email

          def name
            ::Settings.info.contact.name
          end

          def url
            ::Settings.info.contact.url
          end

          def email
            ::Settings.info.contact.email
          end
        end
      end

      class License
        class << self
          attr_accessor :name, :url

          def name
            ::Settings.info.license.name
          end

          def url
            ::Settings.info.license.url
          end
        end
      end
    end
  end
end
