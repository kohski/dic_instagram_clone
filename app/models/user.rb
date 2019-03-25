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

  has_many :active_relationships,foreign_key:'follower_id',class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships,foreign_key:'followed_id',class_name: 'Relationship', dependent: :destroy

  has_many :following,through: :active_relationships,source: :followed
  has_many :followers,through: :passive_relationships,source: :follower

  def follow!(other_user)
    active_relationships.create!(followed_id:other_user.id)
  end

  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

end
