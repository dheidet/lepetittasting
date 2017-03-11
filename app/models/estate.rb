class Estate < ApplicationRecord
  has_many :wines, dependent: :destroy
end
