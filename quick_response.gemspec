# -*- encoding: utf-8 -*-
require File.expand_path("../lib/quick_response/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "quick_response"
  s.version     = QuickResponse::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Robin Clart"]
  s.email       = ["robin@charlin.be"]
  s.homepage    = "http://rubygems.org/gems/quick_response"
  s.summary     = "QR code generator"
  s.description = "A simple gem that output an image url for a given data"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "quick_response"

  s.add_development_dependency "bundler", ">= 1.0.0.rc.6"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
