class Tasting < ApplicationRecord
  belongs_to :user
  belongs_to :wine

  mount_uploader :photo, PhotoUploader
end
