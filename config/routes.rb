Rails.application.routes.draw do
  resources :fornecedors
  resources :pecas
  get "peca/teste" => "pecas#teste"
  root "pecas#index"
end
