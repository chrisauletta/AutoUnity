class AddReferencesEndereco < ActiveRecord::Migration[5.1]
  def change
  	  	    add_column :enderecos, :cliente_id, :integer

  end
end
