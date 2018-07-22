class Course < ApplicationRecord
    has_many :questions
    belongs_to :subject

    mount_uploader :icon, ImageUploader
    validates_processing_of :icon


    #scope
    scope :newest, -> { order(updated_at: :desc) }
    scope :search_by_name, -> (search_name) { where('name LIKE ?', "%#{search_name}%") }
    
    private
    def image_size_validation
        errors[:icon] << "should be less than 500KB" if image.size > 0.5.megabytes
    end
end
