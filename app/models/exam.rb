class Exam < ApplicationRecord
    has_many :exam_details
    belongs_to :user
    belongs_to :course

    accepts_nested_attributes_for :exam_details #lồng form

    scope :newest, -> { order(updated_at: :desc) }
end
