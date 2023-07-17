Rails.application.routes.draw do

  resources :shortened_urls, only: [:create]

  get "/:short_url", to: "shortened_urls#redirect"
end
