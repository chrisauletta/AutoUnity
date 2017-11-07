class Cliente < ApplicationRecord
	has_many :veiculo, :dependent => :destroy
	accepts_nested_attributes_for :veiculo, :allow_destroy => true 

	has_one :cliente_f
	accepts_nested_attributes_for :cliente_f, :allow_destroy => true 	

	has_one :cliente_j
	accepts_nested_attributes_for :cliente_j, :allow_destroy => true 	

	validates :celular, presence: true
	validates :rua, presence: true
	validates :numero, presence: true
	validates :bairro, presence: true
	validates :cidade, presence: true
	
end
