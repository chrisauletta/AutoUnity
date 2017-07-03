Rails.application.routes.draw do
  resources :fornecedors
  resources :pecas
  get "/estoque" => "estoque#index"
  post "/estoque/edit" => "estoque#salva"
end
