class ServicoOrcController < ApplicationController


	def inclui_servico
		servico = ServicoOrc.new
		servico.orcamento_id = params[:id]
		servico.servico_id =  params[:servico_id]
		servico.preco_s = params[:preco_s] 
		o  = Orcamento.find(params[:id])
		o.valor_total += servico.preco_s
		o.save
		servico.save
		redirect_back fallback_location: @orcamento
	end


	def destroy
		@ServicoOrc = ServicoOrc.find(params[:id])
		o = Orcamento.find(@ServicoOrc.orcamento_id)
		o.valor_total -= @ServicoOrc.preco_o
		o.save
	    @ServicoOrc.destroy
	    redirect_back fallback_location: @orcamento
	end

		def edit
		servico = ServicoOrc.find(params[:id])
		o = Orcamento.find(servico.orcamento_id)
		precov = servico.preco_s
		o.valor_total -= precov

		servico.preco_s = params[:preco_s]

		preco = servico.preco_s
		o.valor_total += preco

		o.save
	    servico.save
	    redirect_back fallback_location: @orcamento
	end
end
