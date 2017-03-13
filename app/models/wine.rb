class Wine < ApplicationRecord
  belongs_to :estate
  belongs_to :user
  has_many :tastings

end
