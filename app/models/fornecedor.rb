class Fornecedor < ApplicationRecord

	before_save {self.rua = rua.upcase}
	before_save {self.bairro = bairro.upcase}
	before_save {self.cidade = cidade.upcase}
	before_save {self.uf = uf.upcase}
	before_save {self.cep = cep.upcase}
	before_save {self.complemento = complemento.upcase}
	before_save {self.nome_fornecedor = nome_fornecedor.upcase}
	before_save {self.ramo = ramo.upcase}
	before_save {self.vendedor = vendedor.upcase}

end
