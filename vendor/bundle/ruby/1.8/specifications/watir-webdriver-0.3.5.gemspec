# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "watir-webdriver"
  s.version = "0.3.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jari Bakken"]
  s.date = "2011-10-05"
  s.description = "WebDriver-backed Watir"
  s.email = ["jari.bakken@gmail.com"]
  s.homepage = "http://github.com/jarib/watir-webdriver"
  s.require_paths = ["lib"]
  s.rubyforge_project = "watir-webdriver"
  s.rubygems_version = "1.8.11"
  s.summary = "Watir on WebDriver"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<selenium-webdriver>, [">= 0.2.2"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6"])
      s.add_development_dependency(%q<yard>, ["~> 0.6"])
      s.add_development_dependency(%q<webidl>, [">= 0.1.1"])
      s.add_development_dependency(%q<sinatra>, ["~> 1.0"])
      s.add_development_dependency(%q<rake>, ["~> 0.9.2"])
      s.add_development_dependency(%q<fuubar>, ["~> 0.0.6"])
      s.add_development_dependency(%q<nokogiri>, [">= 0"])
      s.add_development_dependency(%q<activesupport>, ["~> 2.3.5"])
    else
      s.add_dependency(%q<selenium-webdriver>, [">= 0.2.2"])
      s.add_dependency(%q<rspec>, ["~> 2.6"])
      s.add_dependency(%q<yard>, ["~> 0.6"])
      s.add_dependency(%q<webidl>, [">= 0.1.1"])
      s.add_dependency(%q<sinatra>, ["~> 1.0"])
      s.add_dependency(%q<rake>, ["~> 0.9.2"])
      s.add_dependency(%q<fuubar>, ["~> 0.0.6"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<activesupport>, ["~> 2.3.5"])
    end
  else
    s.add_dependency(%q<selenium-webdriver>, [">= 0.2.2"])
    s.add_dependency(%q<rspec>, ["~> 2.6"])
    s.add_dependency(%q<yard>, ["~> 0.6"])
    s.add_dependency(%q<webidl>, [">= 0.1.1"])
    s.add_dependency(%q<sinatra>, ["~> 1.0"])
    s.add_dependency(%q<rake>, ["~> 0.9.2"])
    s.add_dependency(%q<fuubar>, ["~> 0.0.6"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<activesupport>, ["~> 2.3.5"])
  end
end
