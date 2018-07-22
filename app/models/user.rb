class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and 
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
         :token_authenticatable
  has_many :exams

  scope :newest, -> { order(updated_at: :desc) }
  # before_save :ensure_authentication_token

  # attr_accessible :name, :email, :password, :password_confirmation, :remember_me
end
