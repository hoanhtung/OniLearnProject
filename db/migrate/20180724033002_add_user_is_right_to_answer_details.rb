class AddUserIsRightToAnswerDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :answer_details, :user_id_right, :boolean
  end
end
