class Question < ApplicationRecord
    has_many :answers
    has_many :exam_details
    belongs_to :course

    accepts_nested_attributes_for :answers #lồng form
end
