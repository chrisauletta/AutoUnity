class FornecedorsController < ApplicationController
  before_action :set_fornecedor, only: [:show, :edit, :update, :destroy]

  # GET /fornecedors
  def index
    @fornecedors = Fornecedor.all
  end

  # GET /fornecedors/1
  def show
  end

  # GET /fornecedors/new
  def new
    @fornecedor = Fornecedor.new
  end

  # GET /fornecedors/1/edit
  def edit
  end

  # POST /fornecedors
  def create
    @fornecedor = Fornecedor.new(fornecedor_params)

    if @fornecedor.save
      redirect_to fornecedors_path , notice: 'Fornecedor criado'
    else
      render :new
    end
  end

  # PATCH/PUT /fornecedors/1
  def update
    if @fornecedor.update(fornecedor_params)
      redirect_to @fornecedor, notice: 'Fornecedor was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /fornecedors/1
  def destroy
    @fornecedor.destroy
    redirect_to fornecedors_url, notice: 'Fornecedor was successfully destroyed.'
  end

  def busca_fornecedors
  @nome = params[:nome_p]
  @fornecedors_search = Fornecedor.where "nome_fornecedor like ?", "%#{@nome}%"
   #@fornecedors_search = Fornecedor.all
  puts @nome
    respond_to do |format|
      format.html 
      format.js
    end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fornecedor
      @fornecedor = Fornecedor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fornecedor_params
      params.require(:fornecedor).permit(:nome_fornecedor, :ramo, :vendedor, :telefone,:rua, :numero, :bairro, :cidade, :uf, :cep, :complemento)
    end
end
