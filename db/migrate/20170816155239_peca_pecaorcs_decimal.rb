class PecaPecaorcsDecimal < ActiveRecord::Migration[5.1]
  def change
  	 change_column :pecas , :preco , :decimal , precisão: 5 , escala: 2
  	 change_column :peca_orcs , :preco_o , :decimal , precisão: 5 , escala: 2
  end
end
