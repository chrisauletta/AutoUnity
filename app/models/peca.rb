class Peca < ApplicationRecord
	belongs_to :fornecedor

	has_many :peca_orc
	has_many :orcamento, through: :peca_orc

	before_save {self.nome = nome.upcase}
	before_save {self.tipo = tipo.upcase}
	before_save {self.fabricante = fabricante.upcase}
	before_save {self.marca_carro = marca_carro.upcase}
	before_save {self.modelo_carro = modelo_carro.upcase}

end
