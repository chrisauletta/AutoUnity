class ReportController < ApplicationController
	layout "report"

	def orcamento
		@orcamento = Orcamento.find(params[:id])
    	respond_to do |format|
      	format.html
      	format.pdf {render template: 'report/orcamento', pdf: 'report'}   # Excluding ".pdf" extension.
    	end
  	end
end
