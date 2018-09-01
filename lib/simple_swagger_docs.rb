require "simple_swagger_docs/version"
require_relative 'simple_swagger_docs/v3/openapi'

require 'config'

module SimpleSwaggerDocs
  extend V3::OpenAPI
end
