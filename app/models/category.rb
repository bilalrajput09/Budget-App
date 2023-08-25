class Category < ApplicationRecord
  validates :icon, presence: true
  belongs_to :user
  has_many :category_spendings
  has_many :spendings, through: :category_spendings
  mount_uploader :icon, IconUploader
end
