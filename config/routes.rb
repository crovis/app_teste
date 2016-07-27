Rails.application.routes.draw do

  # Página incial
  get "/" => "home#inicio"

  # Página com modelos 
  get "/modelos" => "modelos#inicio"
end
