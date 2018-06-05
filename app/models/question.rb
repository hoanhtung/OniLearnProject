class Question < ApplicationRecord
    has_many :answers
    has_many :exam_details
    belongs_to :course
end
