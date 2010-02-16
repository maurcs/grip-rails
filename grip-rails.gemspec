# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{grip-rails}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marcus Rosentrater"]
  s.date = %q{2010-02-16}
  s.description = %q{}
  s.email = %q{conradmr@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/grip-rails.rb"
  ]
  s.homepage = %q{http://github.com/meanmarcus/grip-rails}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A gem to help with Rails implimentation of Grip -- a MongoMapper GridFS Attachment gem}
  s.test_files = [
    "spec/grid-rails_spec.rb",
     "spec/grid_file_spec.rb",
     "spec/models.rb",
     "spec/rails_root/app/controllers/application_controller.rb",
     "spec/rails_root/app/helpers/application_helper.rb",
     "spec/rails_root/config/boot.rb",
     "spec/rails_root/config/environment.rb",
     "spec/rails_root/config/environments/development.rb",
     "spec/rails_root/config/environments/production.rb",
     "spec/rails_root/config/environments/test.rb",
     "spec/rails_root/config/initializers/backtrace_silencers.rb",
     "spec/rails_root/config/initializers/inflections.rb",
     "spec/rails_root/config/initializers/mime_types.rb",
     "spec/rails_root/config/initializers/new_rails_defaults.rb",
     "spec/rails_root/config/initializers/session_store.rb",
     "spec/rails_root/config/routes.rb",
     "spec/rails_root/db/seeds.rb",
     "spec/rails_root/test/performance/browsing_test.rb",
     "spec/rails_root/test/test_helper.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_runtime_dependency(%q<grip>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<grip>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<grip>, [">= 0"])
  end
end

