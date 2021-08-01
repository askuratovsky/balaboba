# frozen_string_literal: true

require_relative "lib/balaboba/version"

Gem::Specification.new do |spec|
  spec.name          = "balaboba"
  spec.version       = Balaboba::VERSION
  spec.authors       = ["Andrey Skuratovsky"]
  spec.email         = ["skuratowsky@gmail.com"]

  spec.summary       = "Gem for Yandex Balaboba API."
  spec.description   = "Just a simple gem for Yandex Balaboba API. Install, use, enjoy. P.S. Works with ruby 3.0+ only."
  spec.homepage      = "https://github.com/askuratovsky/balaboba"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage + "/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 3.2"
  # Uncomment to register a new dependency of your gem
  spec.add_dependency "httparty", "~> 0.18.1"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
