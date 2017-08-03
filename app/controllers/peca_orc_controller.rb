class PecaOrcController < ApplicationController

	def index
	@orcamento = Orcamento.find(params[:id])
	@nome = params[:nome_p]
	@pecas_orc = Peca.where "nome like ?", "%#{@nome}%"
	end

	def inclui_peca
		peca = PecaOrc.new
		peca.orcamento_id = params[:id]
		peca.peca_id =  params[:peca_id]
		peca.quantidade = params[:quantidade]
		peca.preco_o = params[:preco_o] * peca.quantidade
		peca.save
		redirect_back fallback_location: @orcamento
	end

	def destroy
		@PecaOrc = PecaOrc.find(params[:id])
	    @PecaOrc.destroy
	    redirect_back fallback_location: @orcamento
	end
end
