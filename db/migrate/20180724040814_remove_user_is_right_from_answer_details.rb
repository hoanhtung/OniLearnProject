class RemoveUserIsRightFromAnswerDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :answer_details, :user_id_right, :boolean
  end
end
