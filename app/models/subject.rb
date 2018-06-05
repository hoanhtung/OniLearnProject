class Subject < ApplicationRecord
    has_many :courses
    belongs_to :category
end
