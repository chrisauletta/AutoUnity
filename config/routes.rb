Rails.application.routes.draw do
  resources :orcamentos
  resources :clientes
  resources :fornecedors
  resources :pecas
<<<<<<< HEAD
  resources :veiculos
  get "/estoque" => "estoque#index"
  post "/estoque/edit" => "estoque#salva"
=======
  get "peca/teste" => "pecas#teste"
  root "pecas#index"
>>>>>>> 90c59c761251a545a4949a742732909ae4442917
end
