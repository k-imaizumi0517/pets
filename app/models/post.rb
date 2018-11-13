class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  # has_many :comments, dependent: :destroy

  validates :title,
            :text,
            :user_id,
            :category_id,
            presence: true
end
