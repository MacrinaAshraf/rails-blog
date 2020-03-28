class Post < ApplicationRecord
  include ActiveModel::Validations

  validates :title, :content, presence: true
  validates :title, uniqueness: true, length: { maximum: 50 }

  has_many :comments, dependent: :delete_all
  belongs_to :user

end
