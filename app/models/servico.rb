class Servico < ApplicationRecord

	has_many :peca_orc
	has_many :orcamento, through: :peca_orc

	before_save {self.nome = nome.upcase}
    before_save {self.descricao = descricao.upcase}



end
