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
		peca.preco_o = params[:preco_o] 
		peca.preco_o *= peca.quantidade
		o  = Orcamento.find(params[:id])
		o.valor_total += peca.preco_o
		o.save
		peca.save
		redirect_back fallback_location: @orcamento
	end

	def destroy
		@PecaOrc = PecaOrc.find(params[:id])
		o = Orcamento.find(@PecaOrc.orcamento_id)
		o.valor_total -= @PecaOrc.preco_o
		o.save
	    @PecaOrc.destroy
	    redirect_back fallback_location: @orcamento
	end

	def edit
		puts params[:id]
	end
end
