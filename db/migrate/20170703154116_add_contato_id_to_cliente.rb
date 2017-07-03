class AddContatoIdToCliente < ActiveRecord::Migration[5.1]
  def change
    add_column :clientes, :contato_id, :integer
  end
end
