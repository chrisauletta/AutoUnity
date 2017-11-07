class RaformCliente2 < ActiveRecord::Migration[5.1]
  def change
  	drop_table :enderecos
   	add_column :clientes, :rua, :string
   	add_column :clientes, :bairro, :string
   	add_column :clientes, :cidade, :string
   	add_column :clientes, :uf, :string
  	add_column :clientes, :cep, :string
  	add_column :clientes, :numero, :integer
  	add_column :clientes, :complemento, :string

  end
end
