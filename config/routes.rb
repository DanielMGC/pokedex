Rails.application.routes.draw do
    resources :pokemons, :path => "pokemon", only: [:index, :show, :create, :update, :destroy]
end
