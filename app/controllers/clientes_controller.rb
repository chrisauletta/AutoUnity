class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]

  # GET /clientes
  def index

  end

  # GET /clientes/1
  def show
  end

  def new_menu
    @cliente = Cliente.new
    @cliente.build_endereco

    respond_to do |format|
      format.html 
      format.js
    end 
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
    @cliente.build_endereco
    @cliente.veiculo.build
   end

  # GET /clientes/1/edit
  def edit
    @endereco = @cliente.endereco
  end

  # POST /clientes
  def create
    @cliente = Cliente.new(cliente_params)
    km = params[:quilometragem]
    if @cliente.save
      if km != nil
      orc = Orcamento.new
      orc.cliente_id = Cliente.last.id
      orc.veiculo_id =  Veiculo.last.id 
      orc.valor_total = 0
      orc.quilometragem = km
      orc.status = params[:orcamento] [:status]
      orc.save
      end
    redirect_to orcamentos_path, notice: "Cadastro com sucesso"
    else
      render :new
    end
  end

   def create_menu
    @cliente = Cliente.new(cliente_params_menu)
    orc_check = params[:orc_check]
    if @cliente.save
      redirect_to orcamentos_path, notice: 'Cliente criado com sucessso'
    else
      render :new
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
   @nome = params[:nome_c]
   @cliente_search = Cliente.where "nome like ?", "%#{@nome}%"
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
      params.require(:cliente).permit(:nome, :sobrenome,:oficio, :rua, :bairro, :cidade, :uf, :cep, :telefone, :celular, :comercial, :email, :observacoes, :veiculo_attributes => [:placa, :marca, :modelo, :ano, :cor], :endereco_attributes => [:rua, :numero, :bairro, :cidade, :uf, :cep, :complemento])
    end

    def cliente_params_menu
      params.require(:cliente).permit(:nome, :sobrenome, :oficio, :rua, :bairro, :cidade, :uf, :cep, :telefone, :celular, :comercial, :email, :observacoes, :endereco_attributes => [:rua, :numero, :bairro, :cidade, :uf, :cep, :complemento])
    end

end
