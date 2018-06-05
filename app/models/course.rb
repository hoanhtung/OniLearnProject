class Course < ApplicationRecord
    has_many :questions
    belongs_to :subject
end
