class Dog < ApplicationRecord
  belongs_to :user
  belongs_to :type
  belongs_to :age

  validates :name,
            :introduction,
            :image,
            :age_id,
            :type_id,
            :user_id,
            presence: true
  mount_uploader :image, ImageUploader
end
