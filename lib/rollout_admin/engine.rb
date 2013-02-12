module RolloutAdmin
  class Engine < ::Rails::Engine
    isolate_namespace RolloutAdmin
    require 'jquery-ui-rails'
    require 'less-rails-bootstrap'
  end
end
