class Cliente < ApplicationRecord
	has_many :veiculo, :dependent => :destroy
	accepts_nested_attributes_for :veiculo, :allow_destroy => true 

end
