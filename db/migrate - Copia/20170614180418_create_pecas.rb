class CreatePecas < ActiveRecord::Migration[5.1]
  def change
    create_table :pecas do |t|
      t.string :nome
      t.string :tipo
      t.string :fabricante
      t.decimal :preco
      t.string :marca_carro
      t.string :modelo_carro

      t.timestamps
    end
  end
end
