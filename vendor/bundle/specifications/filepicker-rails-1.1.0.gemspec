# -*- encoding: utf-8 -*-
# stub: filepicker-rails 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "filepicker-rails"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Max Tilford"]
  s.date = "2014-03-30"
  s.description = "Makes integrating filepicker.io with rails 4 easy"
  s.email = ["maxtilford@gmail.com"]
  s.homepage = "https://github.com/Ink/filepicker-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Makes integrating filepicker.io with rails 4 easy"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.2"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
      s.add_development_dependency(%q<timecop>, [">= 0"])
      s.add_development_dependency(%q<appraisal>, [">= 0"])
      s.add_development_dependency(%q<capybara>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.2"])
      s.add_dependency(%q<coveralls>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<timecop>, [">= 0"])
      s.add_dependency(%q<appraisal>, [">= 0"])
      s.add_dependency(%q<capybara>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.2"])
    s.add_dependency(%q<coveralls>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<timecop>, [">= 0"])
    s.add_dependency(%q<appraisal>, [">= 0"])
    s.add_dependency(%q<capybara>, [">= 0"])
  end
end
