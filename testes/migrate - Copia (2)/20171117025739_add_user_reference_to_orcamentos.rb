class AddUserReferenceToOrcamentos < ActiveRecord::Migration[5.1]
  def change
    add_reference :orcamentos, :user, foreign_key: true
  end
end
