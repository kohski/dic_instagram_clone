class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :title,presence: true,length:{ maximum:100 }
  validates :image,presence: true
end
