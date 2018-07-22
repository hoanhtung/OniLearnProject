class Category < ApplicationRecord
    has_many :subjects

    scope :newest, -> { order(updated_at: :desc) }
    scope :search_by_name, -> (search_name) { where('name LIKE ?', "%#{search_name}%") }
    #sort
    scope :sort_up_by_name, -> { order(name: :asc) }
    scope :sort_down_by_name, -> { order(name: :desc) }

    scope :sort_by_date, -> { order('name LIKE ?', "%#{search_name}%") }
    scope :sort_by_subject_number, -> { where('name LIKE ?', "%#{search_name}%") }
end
