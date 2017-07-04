class OrcamentosController < ApplicationController
  before_action :set_orcamento, only: [:show, :edit, :update, :destroy]

  # GET /orcamentos
  def index
    @orcamentos = Orcamento.all
  end

  # GET /orcamentos/1
  def show
  end

  # GET /orcamentos/new
  def new
    @orcamento = Orcamento.new
  end

  # GET /orcamentos/1/edit
  def edit
  end

  # POST /orcamentos
  def create
    @orcamento = Orcamento.new(orcamento_params)

    if @orcamento.save
      redirect_to @orcamento, notice: 'Orcamento was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /orcamentos/1
  def update
    if @orcamento.update(orcamento_params)
      redirect_to @orcamento, notice: 'Orcamento was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /orcamentos/1
  def destroy
    @orcamento.destroy
    redirect_to orcamentos_url, notice: 'Orcamento was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orcamento
      @orcamento = Orcamento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def orcamento_params
      params.require(:orcamento).permit(:status, :quilometragem, :valor_total, :descricao, :cliente_id, :veiculo_id)
    end
end
