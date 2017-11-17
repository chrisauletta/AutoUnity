Rails.application.routes.draw do
  get    'sign_in'   => 'sessions#new'
  post   'sign_in'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'
  resources :users
  resources :servicos
  resources :orcamentos
  resources :clientes
  resources :fornecedors
  resources :pecas
  resources :veiculos
  root 'sessions#new'


  get "/cliente/newj" => "clientes#newj", as: :new_clientej

  post "/orc_edit_user/:id" => "orcamentos#seta_user", as: :seta_user

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

#chama o modal edit peca orcamento
  get "/edit_peca_orc/:id" => "orcamentos#edit_peca_orc", as: :edit_peca_orc

#chama modal edit status orcamento
  get "/status_orcamento/:id" => "orcamentos#status_orcamento_js", as: :status_orcamento_js

  get "/bucas_orcamento" => "orcamentos#busca_orcamento", as: :pega_orc

  get "/busca_veiculo" => "veiculos#busca_veiculo", as: :pega_veiculo


  #Dashboard
  get "/dashboard" => "dashboard#index"
    #chamada da table dashboard
  get "/dashboard_busca" => "dashboard#busca_orcamento", as: :busca_orc
    #chamada do menu para criar cliente
  get "/cliente/new_menu" => "clientes#new_menu", as: :new_cliente_menu
  post "/cliente" => "clientes#create_menu", as: :new_cliente2

  #Financeiro
  get "/financeiro" => "financeiro#index"

  #Status Orcamento
  post "status_orcamento/edit/:id" => "orcamentos#status_orcamento", as: :status_orcamento
end
