class AddCollunClientes < ActiveRecord::Migration[5.1]
  def change
  	  	add_column :clientes, :cpf, :string
  	    add_column :clientes, :rg, :string
  	    add_column :clientes, :sexo, :string

  end
end
