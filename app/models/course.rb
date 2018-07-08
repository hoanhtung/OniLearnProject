class Course < ApplicationRecord
    has_many :questions
    belongs_to :subject

    mount_uploader :icon, ImageUploader
    validates_processing_of :icon

    private
    def image_size_validation
        errors[:icon] << "should be less than 500KB" if image.size > 0.5.megabytes
    end
end
