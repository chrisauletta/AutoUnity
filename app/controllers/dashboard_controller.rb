class DashboardController < ApplicationController

	def index
	
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
