class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :content
      t.decimal :mark
      t.integer :course_id

      t.timestamps
    end
  end
end
