# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "watir-webdriver/version"

Gem::Specification.new do |s|
  s.name        = "watir-webdriver"
  s.version     = Watir::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jari Bakken"]
  s.email       = ["jari.bakken@gmail.com"]
  s.homepage    = "http://github.com/jarib/watir-webdriver"
  s.summary     = %q{Watir on WebDriver}
  s.description = %q{WebDriver-backed Watir}

  s.rubyforge_project = "watir-webdriver"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "selenium-webdriver", '>= 0.2.2'

  s.add_development_dependency "rspec", "~> 2.6"
  s.add_development_dependency "yard", "~> 0.6"
  s.add_development_dependency "webidl", ">= 0.1.1"
  s.add_development_dependency "sinatra", "~> 1.0"
  s.add_development_dependency "rake", "~> 0.9.2"
  s.add_development_dependency "fuubar", "~> 0.0.6"
  s.add_development_dependency "nokogiri"
  s.add_development_dependency "activesupport", "~> 2.3.5" # for pluralization during code generation
end
