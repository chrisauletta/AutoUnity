class Endereco < ApplicationRecord
	belongs_to :cliente

	validates :rua, presence: true
	validates :numero, presence: true
	validates :bairro, presence: true
	validates :cidade, presence: true
end
