Gem::Specification.new do |spec|
  spec.name          = "hartman"
  spec.version       = "0.0.1"
  spec.authors       = ["Pere Urbon-Bayes"]
  spec.email         = ["pere.urbon@gmail"]
  spec.description   = %q{Bot for fun and profit, nothing good can come out of here}
  spec.summary       = %q{Just another nasty bot on the internet}
  spec.homepage      = "http://www.purbon.com"
  spec.license       = "Apache 2"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", "~> 4.0"

  spec.add_runtime_dependency "faraday", "~> 0"
  spec.add_runtime_dependency "geocoder", '~> 1.2.6'


  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rack-test", '~> 0'
  spec.add_development_dependency "rspec", "~> 3.0", "> 3.0.0"

end
