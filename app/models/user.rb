class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books, dependent: :destroy

  attachment :profile_image

  validates :name, presence: true
  validates :name, length: { in: 2..20 }
  validates :introduction, length: { in: 0..50 }, on: :update

  validates :name,uniqueness: true

end
