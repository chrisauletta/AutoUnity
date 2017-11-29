class Veiculo < ApplicationRecord
  belongs_to :cliente, optional: true

  validates :marca, presence: true
  validates :modelo, presence: true
  validates :placa, presence: true
  validates :ano, presence: true

 #before_save { self.marca = marca.upercase }

end
