class CreateServicoOrcs < ActiveRecord::Migration[5.1]
  def change
    create_table :servico_orcs do |t|
      t.references :servico_id, foreign_key: true
      t.references :orcamento_id, foreign_key: true
      t.decimal :preco_s

      t.timestamps
    end
  end
end
