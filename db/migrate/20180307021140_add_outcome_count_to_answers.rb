class AddOutcomeCountToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :outcomes_count, :integer
  end
end
