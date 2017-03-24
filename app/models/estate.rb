class Estate < ApplicationRecord
  belongs_to :user
  has_many :wines, dependent: :destroy
  accepts_nested_attributes_for :wines, allow_destroy: true

  validates :name, presence: true
end
