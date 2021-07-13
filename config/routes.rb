Rails.application.routes.draw do

  get "/albums", to: "albums#index", as: "albums"
  get "/albums/:id", to: "albums#show", as: "album"
end
