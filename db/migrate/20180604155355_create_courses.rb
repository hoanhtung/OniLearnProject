class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.string :icon
      t.belongs_to :subject
      t.timestamps
    end
  end
end
