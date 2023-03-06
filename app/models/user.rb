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

  validates :first_name, :last_name, :role, presence: true

end
