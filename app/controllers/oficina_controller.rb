class OficinaController < ApplicationController

	def index
		@orcamento_ofici = Orcamento.all	
	end

end
