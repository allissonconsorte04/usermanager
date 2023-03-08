class User < ApplicationRecord
  ROLES = {
    USER: :user,
    ADMIN: :admin
  }.freeze

  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: ROLES.values

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }, if: :new_record?
  validates :password_confirmation, presence: true, if: :new_record?
end
