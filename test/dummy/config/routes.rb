Rails.application.routes.draw do

  resources :users


  mount RolloutAdmin::Engine => "/testing"
end
