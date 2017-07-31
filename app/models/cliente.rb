class Cliente < ApplicationRecord
	has_one :veiculo

	accepts_nested_attributes_for :veiculo

end
