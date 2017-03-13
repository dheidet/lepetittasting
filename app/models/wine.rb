class Wine < ApplicationRecord
  belongs_to :estate
  belongs_to :user

end
