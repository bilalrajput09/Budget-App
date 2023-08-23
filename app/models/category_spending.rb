class CategorySpending < ApplicationRecord
    belongs_to :category
    belongs_to :spending
end
