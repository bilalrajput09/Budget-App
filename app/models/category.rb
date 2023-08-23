class Category < ApplicationRecord
    validates :icon, presence: true
    belongs_to :user
    mount_uploader :icon, IconUploader
end
