class Competition < ApplicationRecord
  belongs_to :wine
  has_many :competition_price_stages, dependent: :destroy

  accepts_nested_attributes_for :competition_price_stages, allow_destroy: true


end
