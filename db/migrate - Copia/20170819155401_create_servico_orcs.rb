class CreateServicoOrcs < ActiveRecord::Migration[5.1]
  def change
    create_table :servico_orcs do |t|
      t.references :servico, foreign_key: true
      t.references :orcamento, foreign_key: true
      t.decimal :preco_s

      t.timestamps
    end
  end
end
