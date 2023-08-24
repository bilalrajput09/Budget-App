class Spending < ApplicationRecord
  belongs_to :user, foreign_key: :author_id, class_name: 'User'
  has_many :category_spendings
  has_many :categories, through: :category_spendings

  validates :name, :amount, presence: true
end
