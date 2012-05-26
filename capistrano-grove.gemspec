# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "capistrano-grove/version"

Gem::Specification.new do |s|
  s.name        = "capistrano-grove"
  s.version     = Capistrano::Grove::VERSION
  s.authors     = ["Spike Grobstein"]
  s.email       = ["spikegrobstein@mac.com"]
  s.homepage    = "https://github.com/spikegrobstein/capistrano-grove"
  s.summary     = %q{Post to grove.io after a deploy.}
  s.description = %q{Customizable Capistrano tasks for communicating with the grove.io webservice.}

  s.rubyforge_project = "capistrano-grove"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('capistrano', '>= 2.12.0')
  s.add_dependency('grove-rb', '>= 0.2.0')
end
