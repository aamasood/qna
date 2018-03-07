class AddUserResponseCountToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :user_responses_count, :integer
  end
end
