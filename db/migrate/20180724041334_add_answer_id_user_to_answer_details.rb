class AddAnswerIdUserToAnswerDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :answer_details, :answer_id_user, :integer
  end
end
