class PecasController < ApplicationController
  before_action :set_peca, only: [:show, :edit, :update, :destroy]

  # GET /pecas
  def index
    Peca.new
    @pecas = Peca.all
  end

  def busca_pecas
   @nome = params[:nome_p]
   @peca_search = Peca.where "nome like ?", "%#{@nome}%"
   puts @peca_search
    respond_to do |format|
      format.html 
      format.js
    end 
  end

  # GET /pecas/1
  def show
  end

  # GET /pecas/new
  def new
    @peca = Peca.new
    @fornecedors = Fornecedor.all
  end

  # GET /pecas/1/edit
  def edit
        @fornecedors = Fornecedor.all
  end

  # POST /pecas
  def create
    @peca = Peca.new(peca_params)

    if @peca.save
      redirect_to pecas_path, notice: 'Peça Criada Com Sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /pecas/1
  def update
    if @peca.update(peca_params)
      redirect_to pecas_path, notice: 'Peça Editada Com Sucesso.'
    else
      render :edit
    end
  end

  # DELETE /pecas/1
  def destroy
    @peca.destroy
    redirect_to pecas_url, notice: 'Peça Deletada Com Sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peca
      @peca = Peca.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def peca_params
      params.require(:peca).permit(:nome, :tipo, :fabricante, :preco, :marca_carro, :modelo_carro, :fornecedor_id)
    end
end
