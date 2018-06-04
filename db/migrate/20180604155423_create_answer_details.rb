class CreateAnswerDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_details do |t|

      t.timestamps
    end
  end
end
