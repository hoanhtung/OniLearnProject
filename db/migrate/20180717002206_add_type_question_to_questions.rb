class AddTypeQuestionToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :type_question, :integer
  end
end
