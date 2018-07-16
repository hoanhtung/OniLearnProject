class AddTypeCourseToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :type_course, :boolean
  end
end
