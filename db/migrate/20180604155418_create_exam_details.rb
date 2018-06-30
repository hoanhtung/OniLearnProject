class CreateExamDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_details do |t|
      t.integer :exam_id
      t.integer :question_id
      t.decimal :mark_question

      t.belongs_to :exam
      t.belongs_to :question
      t.timestamps
    end
  end
end
