class Servico < ApplicationRecord

	has_many :peca_orc
	has_many :orcamento, through: :peca_orc
end
