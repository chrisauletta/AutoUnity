class EnderecoFornecedor < ActiveRecord::Migration[5.1]
  def change
  	add_column :fornecedors, :rua, :string
   	add_column :fornecedors, :bairro, :string
   	add_column :fornecedors, :cidade, :string
   	add_column :fornecedors, :uf, :string
  	add_column :fornecedors, :cep, :string
  	add_column :fornecedors, :numero, :integer
  	add_column :fornecedors, :complemento, :string
  end
end
