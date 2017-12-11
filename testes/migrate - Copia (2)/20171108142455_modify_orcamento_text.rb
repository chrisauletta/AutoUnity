class ModifyOrcamentoText < ActiveRecord::Migration[5.1]
  def change
  	add_column :orcamento,:ocorrencia, :text
  	add_column :orcamento,:diagnostico, :text
  	add_column :orcamento,:execucao, :text
  end
end
