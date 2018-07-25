class ExamDetail < ApplicationRecord
    has_many :answer_details
    belongs_to :exam
    belongs_to :question
end
