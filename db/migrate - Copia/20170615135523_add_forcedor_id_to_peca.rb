class AddForcedorIdToPeca < ActiveRecord::Migration[5.1]
  def change
    add_column :pecas, :fornecedor_id, :references
  end
end
