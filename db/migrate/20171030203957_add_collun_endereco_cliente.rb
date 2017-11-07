class AddCollunEnderecoCliente < ActiveRecord::Migration[5.1]
  def change
  	  	add_column :clientes, :endereco_id, :integer

  end
end
