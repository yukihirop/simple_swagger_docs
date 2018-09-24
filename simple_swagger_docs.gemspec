lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "simple_swagger_docs/version"

Gem::Specification.new do |spec|
  spec.name          = "simple_swagger_docs"
  spec.version       = SimpleSwaggerDocs::VERSION
  spec.authors       = ["yukihirop"]
  spec.email         = ["yfsidejob@gmail.com"]

  spec.summary       = %q{Generates swagger-ui json files for Rails APIs with a simple DSL.}
  spec.description   = %q{Generates swagger-ui json files for Rails APIs with a simple DSL.}
  spec.homepage      = "https://github.com/yukihirop/simple_swagger_docs"
  spec.license       = "MIT".freeze

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.1p111".freeze)

  spec.add_development_dependency "bundler", "~> 1.16.a"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "erubis"

  spec.add_runtime_dependency "config"
  spec.add_runtime_dependency "activesupport"
end
