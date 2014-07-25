# -*- encoding: utf-8 -*-
# stub: headjs-rails 0.4.2 ruby lib

Gem::Specification.new do |s|
  s.name = "headjs-rails"
  s.version = "0.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["David Bittencourt"]
  s.date = "2013-11-19"
  s.description = "This gem adds a helper and generator to facilitate the use of Head JS in your Rails 3 projects the same way you would normally add javascript tags using Rails default helpers."
  s.email = "muitocomplicado@gmail.com"
  s.extra_rdoc_files = ["LICENSE.txt", "README.md"]
  s.files = ["LICENSE.txt", "README.md"]
  s.homepage = "http://github.com/muitocomplicado/headjs-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Provides Rails 3 helper and generator for adding Head JS support."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end
