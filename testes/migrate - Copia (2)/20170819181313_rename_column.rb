class RenameColumn < ActiveRecord::Migration[5.1]
  def change
  	rename_column :servico_orcs, :orcamento_id_id, :orcamento_id
  	rename_column :servico_orcs, :servico_id_id, :servico_id
  end
end
