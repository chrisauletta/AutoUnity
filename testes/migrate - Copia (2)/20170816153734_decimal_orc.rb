class DecimalOrc < ActiveRecord::Migration[5.1]
  def change
  	change_column :orcamentos , :valor_total , :decimal , precisão: 5 , escala: 2
  end
end
