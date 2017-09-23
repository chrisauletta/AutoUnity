class DashboardController < ApplicationController

	def index
		
		@orcamentoC = Orcamento.where "status = 'Cotaçao'"
		@orcamentoP = Orcamento.where "status = 'Pendende de aprovaçao'"
	end

end
