class Cliente < ApplicationRecord
	has_many :veiculo, :dependent => :destroy
	accepts_nested_attributes_for :veiculo, :allow_destroy => true 

	has_one :endereco
	accepts_nested_attributes_for :endereco	

	validates :nome, presence: true
	validates :sobrenome, presence: true
	validates :celular, presence: true
	
end
