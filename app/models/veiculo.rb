class Veiculo < ApplicationRecord
  belongs_to :cliente, optional: true
end
