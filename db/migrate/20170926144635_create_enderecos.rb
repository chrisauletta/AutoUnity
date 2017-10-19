class CreateEnderecos < ActiveRecord::Migration[5.1]
  def change
    create_table :enderecos do |t|
      t.string :estado
      t.string :cidade
      t.string :bairro
      t.string :rua
      t.string :numero
      t.string :complemento

      t.timestamps
    end
  end
end
