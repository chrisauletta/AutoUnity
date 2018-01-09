class AddCollunAnoPeca < ActiveRecord::Migration[5.1]
  def change
  	  	add_column :pecas, :ano, :integer
  end
end
