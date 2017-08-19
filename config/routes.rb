Rails.application.routes.draw do
  resources :servicos
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

  get "/busca_cliente/:id" => "clientes#busca_cliente_id", as: :pega_cliente_id
  get "/busca_pecas" => "pecas#busca_pecas", as: :pega_peca
  get "/busca_cliente" => "clientes#busca_cliente", as: :pega_cliente
  get "/edit_peca_orc/:id" => "orcamentos#edit_peca_orc", as: :edit_peca_orc

  root "pecas#index"
end
