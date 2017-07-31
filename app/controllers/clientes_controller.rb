class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]

  # GET /clientes
  def index
    @clientes = Cliente.all
  end

  # GET /clientes/1
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
    @cliente.build_veiculo
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes
  def create
    @cliente = Cliente.new(cliente_params)
    orc_check = params[:orc_check]
    if @cliente.save
      if orc_check == 'yes'
      orc = Orcamento.new
      orc.cliente_id = Cliente.last.id
      orc.veiculo_id =  Veiculo.last.id 
      orc.status =  'Ativo'
      orc.save
    end
      redirect_to orcamento_path, notice: 'Cliente e veiculo criado com sucessso'
    else
      render :new
    end
  end

  # PATCH/PUT /clientes/1
  def update
    if @cliente.update(cliente_params)
      redirect_to @cliente, notice: 'Cliente was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /clientes/1
  def destroy
    Veiculo.destroy params["id"]
    @cliente.destroy
    redirect_to clientes_url, notice: 'Cliente was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cliente_params
      params.require(:cliente).permit(:nome, :oficio, :rua, :bairro, :cidade, :uf, :cep, :telefone, :celular, :comercial, :email, :observacoes, :veiculo_attributes => [:placa, :marca, :modelo, :ano, :cor])
    end
end
