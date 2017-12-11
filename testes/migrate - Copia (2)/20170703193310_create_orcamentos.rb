class CreateOrcamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :orcamentos do |t|
      t.string :status
      t.integer :quilometragem
      t.integer :valor_total
      t.text :descricao
      t.references :cliente, foreign_key: true
      t.references :veiculo, foreign_key: true

      t.timestamps
    end
  end
end