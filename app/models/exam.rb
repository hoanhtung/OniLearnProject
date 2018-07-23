class Exam < ApplicationRecord
    has_many :exam_details
    belongs_to :user

    accepts_nested_attributes_for :exam_details #lồng form
end
