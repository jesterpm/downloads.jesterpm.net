Rails.application.routes.draw do
  resources :downloads, :only => [:index, :show], :id => /.+/
end
