class AddQuantidadeToPecaOrc < ActiveRecord::Migration[5.1]
  def change
    add_column :peca_orcs, :quantidade, :integer
  end
end
