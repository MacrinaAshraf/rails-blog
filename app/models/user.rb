class User < ActiveRecord::Base
  include ActiveModel::Validations

  validates :name, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_secure_password

  has_many :comments, dependent: :delete_all
  has_many :posts, dependent: :delete_all
end
