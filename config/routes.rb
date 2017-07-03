Rails.application.routes.draw do
  resources :clientes
  resources :fornecedors
  resources :pecas
  resources :veiculos
  get "/estoque" => "estoque#index"
  post "/estoque/edit" => "estoque#salva"
end
