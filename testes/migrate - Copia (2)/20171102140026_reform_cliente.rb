class ReformCliente < ActiveRecord::Migration[5.1]
  def change
  	  	remove_column :clientes, :nome
  	  	remove_column :clientes, :oficio
  	  	remove_column :clientes, :sobrenome
  	  	remove_column :clientes, :cpf
  	  	remove_column :clientes, :rg
		remove_column :clientes, :sexo
		remove_column :clientes, :endereco_id
  end
end
