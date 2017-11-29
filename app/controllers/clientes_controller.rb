class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:new,:newj, :create,:show, :edit, :update, :destroy]

  # GET /clientes
  def index

  end

  # GET /clientes/1
  def show
  end

  def newj
    @cliente = Cliente.new
    @cliente.build_cliente_j
    @cliente.veiculo.build
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
    @cliente.build_cliente_f
    @cliente.veiculo.build
   end

  # GET /clientes/1/edit
  def edit

  end

  # POST /clientes
  def create
    c = nil
    n = 0
    if params[:cliente][:cliente_j_attributes] != nil
      n = 1
      c = cliente_params2
    else 
      n = 2
      c = cliente_params
    end
    @cliente = Cliente.new(c)
    km = params[:quilometragem]
    if @cliente.save
      if km != nil
      orc = Orcamento.new
      orc.cliente_id = Cliente.last.id
      orc.veiculo_id =  Veiculo.last.id 
      orc.valor_total = 0
      orc.quilometragem = km
      orc.status = params[:orcamento] [:status]
      orc.ocorrencia = params[:ocorrencia]
      orc.user_id = 0
      orc.save
      end
    redirect_to orcamentos_path, notice: "Cadastro com sucesso"
    else
      if n == 1
        render :newj
      else
        render :new
      end
    end
  end


  # PATCH/PUT /clientes/1
  def update
    if @cliente.update(cliente_params)
      redirect_to @cliente, notice: 'Cliente editado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /clientes/1
  def destroy
    Veiculo.where(cliente_id: params["id"]).destroy_all 
    @cliente.destroy
    redirect_to clientes_url, notice: 'Cliente was successfully destroyed.'
  end

  def busca_cliente
   @selec =  params[:cli] [:selec]
   nome = params[:nome_c]
   if @selec == "Nome"
    @cliente_search = Cliente.joins "INNER JOIN cliente_fs on cliente_fs.cliente_id = clientes.id where cliente_fs.nome like '%#{nome}%'"
   elsif @selec == "Razao Social"
    @cliente_search = Cliente.where "id == (select cliente_id from cliente_js where " "razao_social like " "'%#{nome}%')"
   end
   #@cliente_search = Cliente.where "nome like ?", "%#{@nome}%"
    respond_to do |format|
      format.html 
      format.js
    end 
  end

def busca_cliente_id
  @cliente_search = Cliente.find(params[:id])
  respond_to do |format|
    format.html { render :edit }
    format.js 
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cliente_params
      params.require(:cliente).permit(:telefone, :celular, :comercial, :email, :observacoes,:rua, :numero, :bairro, :cidade, :uf, :cep, :complemento, :veiculo_attributes => [:placa, :marca, :modelo, :ano, :cor], :cliente_f_attributes => [:nome, :sobrenome, :cpf, :rg, :sexo, :oficio, :id])
    end

    def cliente_params2
      params.require(:cliente).permit(:telefone, :celular, :comercial, :email, :observacoes,:rua, :numero, :bairro, :cidade, :uf, :cep, :complemento, :veiculo_attributes => [:placa, :marca, :modelo, :ano, :cor], :cliente_j_attributes => [:razao_social, :nome_fantasia, :cnpj, :representante, :id])
    end
    

end
