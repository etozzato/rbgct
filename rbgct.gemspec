# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rbgct/version"

Gem::Specification.new do |s|
  s.name        = "rbgct"
  s.version     = Rbgct::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Emanuele Tozzato"]
  s.email       = ["etozzato@gmail.com"]
  s.homepage    = "http://www.mekdigital.com"
  s.summary     = %q{Ruby Google Chart Tools}
  s.description = %q{Google Chart Tools provide a perfect way to visualize data on your website: now on Ruby}

  s.rubyforge_project = "rbgct"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
