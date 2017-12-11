class CreateClienteFs < ActiveRecord::Migration[5.1]
  def change
    create_table :cliente_fs do |t|
      t.string :nome
      t.string :sobrenome
      t.string :oficio
      t.string :cpf
      t.string :rg
      t.string :sexo
      t.references :cliente, foreign_key: true

      t.timestamps
    end
  end
end
