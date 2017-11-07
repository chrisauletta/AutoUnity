class CreateClienteJs < ActiveRecord::Migration[5.1]
  def change
    create_table :cliente_js do |t|
      t.string :razao_social
      t.string :nome_fantasia
      t.string :cnpj
      t.string :representante
      t.references :cliente, foreign_key: true


      t.timestamps
    end
  end
end
