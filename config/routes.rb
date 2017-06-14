Rails.application.routes.draw do
  resources :pecas
  get "peca/teste" => "pecas#teste"
end
