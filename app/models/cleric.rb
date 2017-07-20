class Cleric < ApplicationRecord
  validates :name, presence: true
  validates :position, presence: true

  mount_uploader :image, ImageUploader
end
