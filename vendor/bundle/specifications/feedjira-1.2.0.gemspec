# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "feedjira"
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Paul Dix", "Julien Kirch", "Ezekiel Templin", "Jon Allured"]
  s.date = "2014-04-11"
  s.description = "A library designed to retrieve and parse feeds as quickly as possible"
  s.email = "feedjira@gmail.com"
  s.homepage = "http://feedjira.com"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.2"
  s.summary = "A feed fetching and parsing library"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sax-machine>, ["~> 0.2.1"])
      s.add_runtime_dependency(%q<curb>, ["~> 0.8.1"])
      s.add_runtime_dependency(%q<loofah>, ["~> 1.2.1"])
      s.add_development_dependency(%q<rspec>, ["~> 2.14.0"])
    else
      s.add_dependency(%q<sax-machine>, ["~> 0.2.1"])
      s.add_dependency(%q<curb>, ["~> 0.8.1"])
      s.add_dependency(%q<loofah>, ["~> 1.2.1"])
      s.add_dependency(%q<rspec>, ["~> 2.14.0"])
    end
  else
    s.add_dependency(%q<sax-machine>, ["~> 0.2.1"])
    s.add_dependency(%q<curb>, ["~> 0.8.1"])
    s.add_dependency(%q<loofah>, ["~> 1.2.1"])
    s.add_dependency(%q<rspec>, ["~> 2.14.0"])
  end
end
