Rails.application.routes.draw do
  resources :fornecedors
  resources :pecas
  get "/estoque" => "estoque#index"
end
