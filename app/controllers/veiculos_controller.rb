class VeiculosController < ApplicationController
  before_action :set_veiculo, only: [:show, :edit, :update, :destroy]

  # GET /veiculos
  def index
    @veiculos = Veiculo.all
  end

  # GET /veiculos/1
  def show
  end

  # GET /veiculos/new
  def new
    @veiculo = Veiculo.new
    @clientes = Cliente.first(10)
  end

  # GET /veiculos/1/edit
  def edit
     @clientes = Cliente.first(10)
  end

  # POST /veiculos
  def create
    if params[:cliente_id] != nil
    @veiculo = Veiculo.new(veiculo_params)
    @veiculo.cliente_id = params[:cliente_id]

    if @veiculo.save
      redirect_to @veiculo, notice: 'Veiculo was successfully created.'
    else
    redirect_to new_veiculo_path, notice: 'Cliente nao informado'
    end
    
    else
    redirect_to new_veiculo_path, notice: 'Cliente nao informado'
    end
  end

  # PATCH/PUT /veiculos/1
  def update
    if @veiculo.update(veiculo_params)
      redirect_to @veiculo, notice: 'Veiculo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /veiculos/1
  def destroy
    @veiculo.destroy
    redirect_to veiculos_url, notice: 'Veiculo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_veiculo
      @veiculo = Veiculo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def veiculo_params
      params.require(:veiculo).permit(:placa, :marca, :modelo, :ano, :cor)
    end
end
