# -*- encoding: utf-8 -*-
# stub: simple_hashtag 0.1.9 ruby lib

Gem::Specification.new do |s|
  s.name = "simple_hashtag"
  s.version = "0.1.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Raphael Campardou"]
  s.date = "2013-11-05"
  s.description = "Parse, store retreive and format hashtags in your text."
  s.email = ["ralovely@gmail.com"]
  s.homepage = "https://github.com/ralovely/simple_hashtag"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "2.2.2"
  s.summary = "Simple Hashtag is a mix between\u{2013}well\u{2013}hashtags as we know them and categories. It will scan your Active Record attribute for a tag and store it in an index."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["> 3.2.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["> 3.2.0"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["> 3.2.0"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end
