class AddOutcomeCountToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :outcomes_count, :integer
  end
end
