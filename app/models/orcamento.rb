class Orcamento < ApplicationRecord
  belongs_to :cliente
  belongs_to :veiculo

  has_many :peca_orc
  has_many :peca, through: :peca_orc

  has_many :servico_orc
  has_many :servico, through: :servico_orc

  validates :status, presence: true
  validates :quilometragem, presence: true

 

end
