class AddColunaPeca < ActiveRecord::Migration[5.1]
  def change
  	add_column :pecas, :marca_carro, :string
  	add_column :pecas, :modelo_carro, :string 
  end
end
