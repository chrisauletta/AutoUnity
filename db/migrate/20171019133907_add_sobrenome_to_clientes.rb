class AddSobrenomeToClientes < ActiveRecord::Migration[5.1]
  def change
    add_column :clientes, :sobrenome, :string
  end
end
