class Question < ApplicationRecord
    has_many :answers
    has_many :exam_details
    belongs_to :course

    accepts_nested_attributes_for :answers #lồng form

    scope :load_multichoice, -> { where(multichoice: true) }
    scope :load_true_false, -> { where(multichoice: false) }
    scope :load_random, -> (amount) { order("RANDOM()").limit(amount) }
    

end
