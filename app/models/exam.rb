class Exam < ApplicationRecord
    has_many :exam_details
    belongs_to :user
end
