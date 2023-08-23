class Category < ApplicationRecord
    validates :icon, presence: true
    belongs_to :user
end
