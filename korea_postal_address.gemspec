# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'postal_address/version'

Gem::Specification.new do |spec|
  spec.name          = "korea_postal_address"
  spec.version       = PostalAddress::VERSION
  spec.author        = "onesup"
  spec.email         = "onesup.lee@gmail.com"

  spec.summary       = "Generating well formed postal address in Korea"
  spec.description   = "Give road name address or old land-lot number address to this then it generate well formed postal address."
  spec.homepage      = "https://github.com/onesup/korea_postal_address"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org/"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.2.0"

  spec.add_dependency "rest-client", "~> 2.0", ">= 2.0.0"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "minitest", "~> 5.8", ">= 5.8.3"
  spec.add_development_dependency "rake", "~> 11.2", ">= 11.2.2"
end
