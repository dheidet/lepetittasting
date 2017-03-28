class Tasting < ApplicationRecord
  belongs_to :user
  belongs_to :wine, optional: true

  mount_uploader :photo, PhotoUploader

end
