class CreateExamDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_details do |t|

      t.timestamps
    end
  end
end
