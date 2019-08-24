class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable # , :omniauthable

  has_one_attached :avatar
  has_many :carousels, dependent: :destroy
  has_many :venues, dependent: :destroy
end
