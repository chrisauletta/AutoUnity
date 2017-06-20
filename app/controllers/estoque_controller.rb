class EstoqueController < ApplicationController

	def index
		@pecas_e = Peca.all
	end

end
