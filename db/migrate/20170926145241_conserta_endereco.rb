class ConsertaEndereco < ActiveRecord::Migration[5.1]
  def change
  	    add_column :enderecos, :cep, :string
  	    rename_column :enderecos, :estado, :uf
  end
end
