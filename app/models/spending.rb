class Spending < ApplicationRecord
    belongs_to :user
    has_many :category_spendings
    has_many :categories, through: :category_spendings
end
