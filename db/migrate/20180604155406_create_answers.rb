class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :content
      t.boolean :is_right, :default => false
      t.belongs_to :question
      t.timestamps
    end
  end
end
