Rails.application.routes.draw do

  # Página incial
  get "/" => "home#inicio"

  # Página com modelos 
  get "/modelos" => "models#inicio"
end
