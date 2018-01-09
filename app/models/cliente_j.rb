class ClienteJ < ApplicationRecord
	  belongs_to :cliente

	before_save {self.razao_social = razao_social.upcase}
	before_save {self.nome_fantasia = nome_fantasia.upcase}
	before_save {self.representante = representante.upcase}

end
