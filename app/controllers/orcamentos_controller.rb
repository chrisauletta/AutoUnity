class OrcamentosController < ApplicationController
  before_action :set_orcamento, only: [:show, :edit, :update, :destroy]
  #before_action :authorize, except: [:create,:show, :edit, :update, :destroy, :create, :update, :busca_orcamento, :busca_orcamento_status]

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
    @cliente_orc = Cliente.all
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
    @orcamento.user_id = 0
    @orcamento.cliente_id = Veiculo.find(params[:veiculo_id]).cliente_id
    @orcamento.veiculo_id = params[:veiculo_id]
    if @orcamento.save
      redirect_to @orcamento, notice: 'Orcamento craido com sucesso.'
    else
      redirect_to new_orcamento_path, notice: @orcamento.errors.full_messages
    end
    else
      redirect_to new_orcamento_path, notice: 'Veiculo nao informado'
    end
  end

  # PATCH/PUT /orcamentos/1
  def update
    if @orcamento.update(orcamento_params)
      redirect_to @orcamento, notice: 'Orcamento Atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /orcamentos/1
  def destroy
    @orcamento.destroy
    redirect_to orcamentos_url, notice: 'Orçamento criado com sucesso.'
  end

  def busca_orcamento_status

  status = params[:orcamento] [:status]  
  if status != ""
      @orc = Orcamento.where "status = " "'#{status}'"
  else 
    @orc = Orcamento.all
  end
    respond_to do |format|
    format.html 
    format.js 
  end
  end

  def busca_orcamento
    @selec =  params[:orcamento] [:selec]
    nome =  params[:nome]
    if @selec == "Nome"
     str = "status = " "'#{status}'" " and cliente_id in (select cliente_id from cliente_fs where " "nome like " "'%#{nome}%')"
     str2 = "cliente_id in (select cliente_id from cliente_fs where " "nome like " "'%#{nome}%')"
    elsif @selec == "Razao Social"
     str = "status = " "'#{status}'" " and cliente_id in (select cliente_id from cliente_js where " "razao_social like " "'%#{nome}%')"
     str2 = "cliente_id in (select cliente_id from cliente_js where " "razao_social like " "'%#{nome}%')"
    end
    status = params[:orcamento] [:status]  

    if status != "" && @selec != "" #Se os dois for preenchido
    @orc = Orcamento.where str
    elsif @selec == "" && status != "" #Se só status for preenchido
    @orc = Orcamento.where "status = " "'#{status}'"
    elsif @selec != "" && status == "" #Se só nome for preenchido
    @orc = Orcamento.where str2
    else
    @orc = Orcamento.all
  end
  respond_to do |format|
    format.html 
    format.js 
  end
end 
    

  def edit_peca_orc
  @peca_edit = PecaOrc.find(params[:id])
  respond_to do |format|
    format.html 
    format.js 
  end
  end

def edit_serv_orc
  @servico_edit = ServicoOrc.find(params[:id])
  respond_to do |format|
    format.html 
    format.js 
  end
  end


  def status_orcamento_js
  @orc = Orcamento.find(params[:id])
    respond_to do |format|
      format.html 
      format.js 
    end
  end

  def status_orcamento
    status = params[:orcamento] [:status]
    orc = Orcamento.find(params[:id])
    orc.status = status
    orc.save
     respond_to do |format|
      format.html 
      format.js 
    end
  end

  def seta_user
    set_orcamento
    logged_in?
    @orcamento.user_id = @current_user.id
    @orcamento.save
    redirect_back fallback_location: @orcamento
  end

  def seta_desc
    set_orcamento
    @orcamento.diagnostico =  params[:diagnostico]
    @orcamento.execucao = params[:execucao]
    @orcamento.save    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orcamento
      @orcamento = Orcamento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def orcamento_params
      params.require(:orcamento).permit(:quilometragem, :ocorrencia, :status)
    end
end
