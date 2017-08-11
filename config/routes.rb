Rails.application.routes.draw do
  resources :orcamentos
  resources :clientes
  resources :fornecedors
  resources :pecas
  resources :veiculos
  get "/estoque" => "estoque#index"
  post "/estoque/edit" => "estoque#salva"
  get "peca/teste" => "pecas#teste"
  
  get "/peca_orc/:id" => "peca_orc#index", as: :peca_orc
  post "/peca_orc/:id" => "peca_orc#inclui_peca", as: :inclui_peca
  delete "/peca_orc/:id" => "peca_orc#destroy"

  get "/report/:id" => "report#orcamento", as: :report_orc

  get "/oficina" => "oficina#index"

  get "/orcamento/cliente/:id" => "orcamentos#cliente", as: :pega_cliente

  root "pecas#index"
end
