class PecasController < ApplicationController
  before_action :set_peca, only: [:show, :edit, :update, :destroy]

  # GET /pecas
  def index
    Peca.new
    @pecas = Peca.all
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
  end

  # POST /pecas
  def create
    @peca = Peca.new(peca_params)

    if @peca.save
      redirect_to @peca, notice: 'Peca was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pecas/1
  def update
    if @peca.update(peca_params)
      redirect_to @peca, notice: 'Peca was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pecas/1
  def destroy
    @peca.destroy
    redirect_to pecas_url, notice: 'Peca was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peca
      @peca = Peca.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def peca_params
      params.require(:peca).permit(:nome, :tipo, :fabricante, :preco, :fornecedor_id)
    end
end
