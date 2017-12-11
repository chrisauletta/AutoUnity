class EstoqueController < ApplicationController

	def index
		@pecas_e = Peca.all
	end

	def salva
		#estoque = Estoque.new
		#estoque.peca_id = params["format"]
		#estoque.save
		redirect_to estoque_url, notice: 'so vai'
	end
end
