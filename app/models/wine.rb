class Wine < ApplicationRecord
  belongs_to :estate, optional: true
  belongs_to :user
  has_many :tastings, dependent: :destroy
  accepts_nested_attributes_for :tastings, allow_destroy: true

  mount_uploader :photo, PhotoUploader
end
