class Veiculo < ApplicationRecord
  belongs_to :cliente, optional: true

  validates :marca, presence: true
  validates :modelo, presence: true
  validates :placa, presence: true
  validates :ano, presence: true

 	before_save { self.marca = marca.upcase }
	before_save {self.modelo = modelo.upcase}
	before_save {self.cor = cor.upcase}

end
