class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.decimal :total_mark
      t.belongs_to :user
      t.timestamps
    end
  end
end
