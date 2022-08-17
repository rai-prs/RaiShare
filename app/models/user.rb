class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  mount_uploader :image, ImageUploader
  has_many :rooms
  has_many :reservations
  validates :self_introduction, length: { maximum: 100 }
  validates :name, presence: true
end
