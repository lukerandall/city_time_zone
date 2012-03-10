# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "city_time_zone/version"

Gem::Specification.new do |s|
  s.name        = "city_time_zone"
  s.version     = CityTimeZone::VERSION
  s.authors     = ["Luke Randall"]
  s.email       = ["luke.randall@gmail.com"]
  s.homepage    = "http://github.com/lukerandall/city_time_zone"
  s.summary     = %q{Lookup the timezone of a city}
  s.description = %q{City timezone allows you to lookup the timezone for most cities in the world with a population > 15k.}


  s.rubyforge_project = "city_time_zone"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_runtime_dependency "sqlite3"
  s.add_runtime_dependency "activesupport"
end
