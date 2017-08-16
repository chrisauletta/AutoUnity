class OrcamentosController < ApplicationController
  before_action :set_orcamento, only: [:show, :edit, :update, :destroy]

  # GET /orcamentos
  def index
    @orcamentos = Orcamento.all
  end

  # GET /orcamentos/1
  def show
  @nome = params[:nome_p]
  @pecas_orc = Peca.where "nome like ?", "%#{@nome}%"
  end

  # GET /orcamentos/new
  def new
    @orcamento = Orcamento.new
    @nome = params[:nome_p]
    @cliente_orc = Cliente.where "nome like ?", "%#{@nome}%"
    @cliente_search = Cliente.new
  end

  # GET /orcamentos/1/edit
  def edit
  end

  def cliente 
  @cliente_search = Cliente.find(params[:id])
  respond_to do |format|
    format.html { render :edit }
    format.js 
  end
  end

  # POST /orcamentos
  def create
    @orcamento = Orcamento.new(orcamento_params)
    @orcamento.valor_total = 0
    @orcamento.cliente_id = Veiculo.find(params[:veiculo_id]).cliente_id
    @orcamento.veiculo_id = params[:veiculo_id]
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
      params.require(:orcamento).permit(:quilometragem, :descricao, :status)
    end
end
