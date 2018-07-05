class Subject < ApplicationRecord
    has_many :courses
    belongs_to :category
    
    mount_uploader :image, ImageUploader

    validates_processing_of :image
    validate :image_size_validation
    #scope
    scope :newest, -> { order(created_at: :desc) }



    private
    def image_size_validation
        errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    end
end
