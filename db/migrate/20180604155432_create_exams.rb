class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.decimal :total_mark
      t.integer :user_id
      
      t.belongs_to :user
      t.belongs_to :course
      t.timestamps
    end
  end
end
