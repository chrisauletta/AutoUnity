class RemoveEnderecoCliente < ActiveRecord::Migration[5.1]
  def change
  	    remove_column :clientes, :rua
  	    remove_column :clientes, :bairro
  	    remove_column :clientes, :cidade
  	    remove_column :clientes, :uf
  	    remove_column :clientes, :cep
  end
end

    #t.string "rua"
    #t.string "bairro"
    #t.string "cidade"
    #t.string "uf"
    #t.string "cep"