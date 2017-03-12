class Estate < ApplicationRecord
  belongs_to :user
  has_many :wines, dependent: :destroy

  validates :name, presence: true
end
