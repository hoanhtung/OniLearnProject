class Category < ApplicationRecord
    has_many :subjects

    scope :newest, -> { order(created_at: :desc) }
end
