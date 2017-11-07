class DeleteCollunClienteEndereco < ActiveRecord::Migration[5.1]
  def change
  	  	remove_column :enderecos, :cliente_id
  end
end
