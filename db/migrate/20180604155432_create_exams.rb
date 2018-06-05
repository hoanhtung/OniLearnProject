class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.integer :user_id
      t.decimal :total_mark
      t.timestamps
    end
  end
end
