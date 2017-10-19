class CreateVeiculos < ActiveRecord::Migration[5.1]
  def change
    create_table :veiculos do |t|
      t.string :placa
      t.string :marca
      t.string :modelo
      t.string :ano
      t.string :cor
      t.references :cliente, foreign_key: true

      t.timestamps
    end
  end
end
