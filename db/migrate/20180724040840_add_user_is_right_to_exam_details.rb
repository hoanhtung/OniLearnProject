class AddUserIsRightToExamDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :exam_details, :user_is_right, :boolean
  end
end
