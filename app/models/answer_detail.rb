class AnswerDetail < ApplicationRecord
    belongs_to :answer
    belongs_to :exam_detail
end
