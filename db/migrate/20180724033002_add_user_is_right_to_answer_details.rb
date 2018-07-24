class AddUserIsRightToAnswerDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :answer_details, :user_id_right, :user_is_right
  end
end
