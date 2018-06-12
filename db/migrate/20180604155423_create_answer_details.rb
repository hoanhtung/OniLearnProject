class CreateAnswerDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_details do |t|
      t.integer :exam_detail_id
      t.integer :answer_id
      t.belongs_to :exam_detail
      t.belongs_to :answer
      t.timestamps
    end
  end
end
