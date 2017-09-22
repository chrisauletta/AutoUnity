class OrcamentosController < ApplicationController
  before_action :set_orcamento, only: [:show, :edit, :update, :destroy]

  # GET /orcamentos
  def index
    @orcamentos = Orcamento.all
  end

  # GET /orcamentos/1
  def show
  @pecaa = PecaOrc.new
  @servico_orc = Servico.all
  @pecas_orc = Peca.all
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


  # POST /orcamentos
  def create
    if params[:veiculo_id] != nil
    @orcamento = Orcamento.new(orcamento_params)
    @orcamento.valor_total = 0
    @orcamento.cliente_id = Veiculo.find(params[:veiculo_id]).cliente_id
    @orcamento.veiculo_id = params[:veiculo_id]
    if @orcamento.save
      redirect_to @orcamento, notice: 'Orcamento was successfully created.'
    else
      redirect_to new_orcamento_path, notice: 'Veiculo nao informado'
    end
    else
      redirect_to new_orcamento_path, notice: 'Veiculo nao informado'
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

  def busca_orcamento
    selec =  params[:orcamento] [:selec]
    nome =  params[:nome]
    status = params[:orcamento] [:status]
    str = "status = " "'#{status}'" " and cliente_id in (select id from clientes where " "nome like " "'%#{nome}%')"
    if status != ""
    @orc = Orcamento.where str
    puts str
    elsif selec == ""
    @orc = Orcamento.where "status = " "'#{status}'"
    else
    @orc = Orcamento.where "cliente_id in (select id from clientes where " "nome like " "'%#{nome}%')"
  end
  respond_to do |format|
    format.html 
    format.js 
  end
    

  def edit_peca_orc
  @peca_edit = PecaOrc.find(params[:id])
  respond_to do |format|
    format.html 
    format.js 
  end
  end

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
