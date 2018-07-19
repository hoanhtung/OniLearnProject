class Category < ApplicationRecord
    has_many :subjects

    scope :newest, -> { order(created_at: :desc) }
    scope :search_by_name, -> (search_name) { where('name LIKE ?', "%#{search_name}%") }
end
