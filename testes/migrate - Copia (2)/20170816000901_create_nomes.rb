class CreateNomes < ActiveRecord::Migration[5.1]
  def change
    create_table :nomes do |t|
      t.text :descricao
      t.decimal :preco

      t.timestamps
    end
  end
end
