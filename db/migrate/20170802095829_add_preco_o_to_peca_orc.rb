class AddPrecoOToPecaOrc < ActiveRecord::Migration[5.1]
  def change
    add_column :peca_orcs, :preco_o, :integer
  end
end
