class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :content
      t.integer :type_question #0: False, 1: True, 2: Multichoice
      t.belongs_to :course
      t.timestamps
    end
  end
end
