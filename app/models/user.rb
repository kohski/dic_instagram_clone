class User < ApplicationRecord
  mount_uploader :image,ImageUploader
  validates :name,presence:true
  validates :email,presence: true,
            length:{maximum:255},
            format:{with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: true
  has_secure_password
  before_validation{ email.downcase! }
  validates :password,presence: true,length:{ minimum:6 }
  has_many :pictures
  has_many :favorites, dependent: :destroy
  has_many :favorite_pictures, through: :favorites, source: :picture
end
