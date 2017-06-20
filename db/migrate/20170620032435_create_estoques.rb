class CreateEstoques < ActiveRecord::Migration[5.1]
  def change
    create_table :estoques do |t|
      t.integer :peca_id

      t.timestamps
    end
  end
end
