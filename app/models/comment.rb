class Comment < ApplicationRecord
  include ActiveModel::Validations

  validates :content, presence: true

  belongs_to :post
end
