class CreateOutcomes < ActiveRecord::Migration
  def change
    create_table :outcomes do |t|
      t.integer :prereq_question_id
      t.integer :answer_id
      t.integer :resulting_question_id

      t.timestamps

    end
  end
end
