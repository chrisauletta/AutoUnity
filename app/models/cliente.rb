class Cliente < ApplicationRecord
	has_many :veiculo, :dependent => :destroy
	accepts_nested_attributes_for :veiculo, :allow_destroy => true 

	has_one :cliente_f
	accepts_nested_attributes_for :cliente_f, :allow_destroy => true 	

	has_one :cliente_j
	accepts_nested_attributes_for :cliente_j, :allow_destroy => true 	

	validates :celular, presence: true
	
	before_save {self.rua = rua.upcase}
	before_save {self.bairro = bairro.upcase}
	before_save {self.cidade = cidade.upcase}
	before_save {self.uf = uf.upcase}
	before_save {self.cep = cep.upcase}
	before_save {self.complemento = complemento.upcase}
	before_save {self.observacoes = observacoes.upcase}


end
