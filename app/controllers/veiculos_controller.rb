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
  end

  # GET /veiculos/1/edit
  def edit
  end

  # POST /veiculos
  def create
    @veiculo = Veiculo.new(veiculo_params)

    if @veiculo.save
      redirect_to @veiculo, notice: 'Veiculo was successfully created.'
    else
      render :new
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
      params.require(:veiculo).permit(:placa, :marca, :modelo, :ano, :cor, :cliente_id)
    end
end
