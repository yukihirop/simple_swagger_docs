require 'erubis'

module SimpleSwaggerDocs
  class Eruby < Erubis::Eruby
    include Erubis::PrefixedLineEnhancer
  end
end
