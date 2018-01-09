class ClienteF < ApplicationRecord
  belongs_to :cliente


	before_save {self.nome = nome.upcase}
	before_save {self.sobrenome = sobrenome.upcase}
	before_save {self.oficio = oficio.upcase}
	before_save {self.sexo = sexo.upcase}
	
end
