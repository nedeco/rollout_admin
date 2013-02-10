$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rollout_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rollout_admin"
  s.version     = RolloutAdmin::VERSION
  s.authors     = ["Alexander Balsam"]
  s.email       = ["a.balsam@nedeco.de"]
  s.homepage    = "http://www.nedeco.de"
  s.summary     = "TODO: Summary of RolloutAdmin."
  s.description = "TODO: Description of RolloutAdmin."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
