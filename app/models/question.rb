class Question < ApplicationRecord
    has_many :answers
    has_many :exam_details
    belongs_to :course

    accepts_nested_attributes_for :answers #lồng form

    scope :load_multichoice, -> { where(type_question: 2) } #2: multichoice
    scope :load_true_false, -> { where(type_question: [0, 1]) } #0/1: true/ false
    scope :load_random, -> (amount) { order("RANDOM()").limit(amount) }
    scope :load_by_course, -> (course_id) { where(course_id: course_id) }
    
    scope :newest, -> { order(created_at: :desc) }

end
