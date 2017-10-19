# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def truncate_all_tables
  config = ActiveRecord::Base.configurations[::Rails.env]
  connection = ActiveRecord::Base.connection
  connection.disable_referential_integrity do
    connection.tables.each do |table_name|
      next if connection.select_value("SELECT count(*) FROM veiculo") == 0
      case config["adapter"]
        when "mysql", "mysql2", "postgresql"
          connection.execute("TRUNCATE veiculo")
        when "sqlite", "sqlite3"
          connection.execute("DELETE FROM veiculo")
          connection.execute("DELETE FROM sqlite_sequence where name='veiculo'")
      end
    end
    connection.execute("VACUUM") if config["adapter"] == "sqlite3"
  end
end