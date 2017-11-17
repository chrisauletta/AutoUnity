class ModifyOrcamentoText2 < ActiveRecord::Migration[5.1]
  def change
  		add_column :orcamentos,:ocorrencia, :text
  	add_column :orcamentos,:diagnostico, :text
  	add_column :orcamentos,:execucao, :text
  end
end
