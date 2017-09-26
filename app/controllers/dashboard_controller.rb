class DashboardController < ApplicationController

	def index
		@orcamentoC = Orcamento.where "status = 'Cotaçao'"
		@orcamentoP = Orcamento.where "status = 'Pendende de aprovaçao'"
	end

	def busca_orcamento
	  status = params[:status]
	  @orc = Orcamento.where "status = " "'#{status}'"
	  respond_to do |format|
	    format.html 
	    format.js 
	  end
	end

end
