# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'double_check/version'

Gem::Specification.new do |spec|
  spec.name          = "double_check"
  spec.version       = DoubleCheck::VERSION
  spec.authors       = ["Nathan Menge"]
  spec.email         = ["nathan.menge@gmail.com"]

  spec.summary       = %q{Gem to add a confirmation to the execution of rake tasks in a production environment}
  spec.description   = %q{This gem enhances rake tasks in an application to have a confirmation before executing when Rails is operating in production mode}
  spec.homepage      = "https://github.com/menge101/double_check"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "lib/tasks"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
