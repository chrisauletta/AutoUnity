class CreateFornecedors < ActiveRecord::Migration[5.1]
  def change
    create_table :fornecedors do |t|
      t.string :nome_fornecedor
      t.string :ramo
      t.string :vendedor
      t.string :telefone

      t.timestamps
    end
  end
end
