# -*- encoding: utf-8 -*-
# stub: active_record-acts_as 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "active_record-acts_as"
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Hassan Zamani"]
  s.date = "2014-08-05"
  s.description = "Simulate multi-table inheritance for activerecord models using a plymorphic association"
  s.email = ["hsn.zamani@gmail.com"]
  s.homepage = "http://github.com/hzamani/active_record-acts_as"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9")
  s.rubygems_version = "2.2.2"
  s.summary = "Simulate multi-table inheritance for activerecord models"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3"])
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
      s.add_development_dependency(%q<rspec>, ["~> 3"])
      s.add_development_dependency(%q<rake>, ["~> 10"])
      s.add_runtime_dependency(%q<activesupport>, ["~> 4"])
      s.add_runtime_dependency(%q<activerecord>, ["~> 4.1.2"])
    else
      s.add_dependency(%q<sqlite3>, ["~> 1.3"])
      s.add_dependency(%q<bundler>, ["~> 1.6"])
      s.add_dependency(%q<rspec>, ["~> 3"])
      s.add_dependency(%q<rake>, ["~> 10"])
      s.add_dependency(%q<activesupport>, ["~> 4"])
      s.add_dependency(%q<activerecord>, ["~> 4.1.2"])
    end
  else
    s.add_dependency(%q<sqlite3>, ["~> 1.3"])
    s.add_dependency(%q<bundler>, ["~> 1.6"])
    s.add_dependency(%q<rspec>, ["~> 3"])
    s.add_dependency(%q<rake>, ["~> 10"])
    s.add_dependency(%q<activesupport>, ["~> 4"])
    s.add_dependency(%q<activerecord>, ["~> 4.1.2"])
  end
end
