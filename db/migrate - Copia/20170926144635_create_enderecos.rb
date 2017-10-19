class CreateEnderecos < ActiveRecord::Migration[5.1]
  def change
    create_table :enderecos do |t|
      t.string :uf
      t.string :cidade
      t.string :bairro
      t.string :rua
      t.string :numero
      t.string :cep
      t.string :complemento
      t.references :cliente

      t.timestamps
    end
  end
end
