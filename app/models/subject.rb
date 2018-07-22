class Subject < ApplicationRecord
    has_many :courses
    belongs_to :category
    
    mount_uploader :image, ImageUploader

    validates_processing_of :image
    validate :image_size_validation
    #scope
    scope :newest, -> { order(updated_at: :desc) }
    scope :search_by_name, -> (search_name) { where("name LIKE ?", "%#{search_name}%") }



    private
    def image_size_validation
        errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    end
end
