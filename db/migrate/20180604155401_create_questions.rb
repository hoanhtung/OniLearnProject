class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :content
      t.decimal5 :mark
      t.decimal2 :mark

      t.timestamps
    end
  end
end
