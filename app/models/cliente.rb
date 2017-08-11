class Cliente < ApplicationRecord
	has_one :veiculo
	has_many :veiculo
	accepts_nested_attributes_for :veiculo

end
