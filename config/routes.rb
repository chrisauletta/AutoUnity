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
  
#Peças Orcamento
  get "/peca_orc/:id" => "peca_orc#index", as: :peca_orc
  post "/peca_orc/:id" => "peca_orc#inclui_peca", as: :inclui_peca
  delete "/peca_orc/:id" => "peca_orc#destroy"
  post "/peca_orc/edit/:id" => "peca_orc#edit", as: :peca_edit_orc 

#Servivo Orcamento
  post "/servico_orc/:id" => "servico_orc#inclui_servico", as: :inclui_servico
  delete "/servico_orc/:id" => "servico_orc#destroy", as: :delete_serv

#Relatorio
  get "/report/:id" => "report#orcamento", as: :report_orc

#Area do mecanico
  get "/oficina" => "oficina#index"

#buscas JS

  get "/busca_cliente/:id" => "clientes#busca_cliente_id", as: :pega_cliente_id
  get "/busca_cliente" => "clientes#busca_cliente", as: :pega_cliente

  get "/busca_pecas" => "pecas#busca_pecas", as: :pega_peca
  
  get "/edit_peca_orc/:id" => "orcamentos#edit_peca_orc", as: :edit_peca_orc

  get "/bucas_orcamento" => "orcamentos#busca_orcamento", as: :pega_orc

  root "dashboard#index"

  #Dashboard
  get "/dashboard" => "dashboard#index"
    #chamada da table dashboard
  get "/dashboard/:status" => "dashboard#busca_orcamento", as: :busca_orc
end
