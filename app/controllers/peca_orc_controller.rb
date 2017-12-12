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
		if logged_in?
		end 
		if @current_user.cargo == "mecanico"
		peca.quantidade = 0.0
		peca.preco_o = 0.0
		else
		peca.quantidade = params[:quantidade]
		peca.preco_o = params[:preco_o] 
		end 
		precov = peca.preco_o * peca.quantidade
		o  = Orcamento.find(params[:id])
		o.valor_total += precov
		o.save
		peca.save
		redirect_back fallback_location: @orcamento
	end

	def destroy
		peca = PecaOrc.find(params[:id])
		o = Orcamento.find(peca.orcamento_id)
		precov = peca.preco_o * peca.quantidade
		o.valor_total -= precov
		o.save
	    peca.destroy
	    redirect_back fallback_location: @orcamento
	end

	def edit
		peca = PecaOrc.find(params[:id])
		o = Orcamento.find(peca.orcamento_id)
		precov = peca.preco_o * peca.quantidade
		o.valor_total -= precov

		peca.preco_o = params[:preco_o]
		peca.quantidade =  params[:quantidade]

		preco = peca.preco_o * peca.quantidade
		o.valor_total += preco

		o.save
	    peca.save
	    redirect_back fallback_location: @orcamento
	end
end
