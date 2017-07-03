class CreateClientes < ActiveRecord::Migration[5.1]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :oficio
      t.string :rua
      t.string :bairro
      t.string :cidade
      t.string :uf
      t.string :cep
      t.string :telefone
      t.string :celular
      t.string :comercial
      t.string :email
      t.string :observacoes

      t.timestamps
    end
  end
end
