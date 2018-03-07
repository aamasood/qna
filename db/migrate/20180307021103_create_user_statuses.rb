class CreateUserStatuses < ActiveRecord::Migration
  def change
    create_table :user_statuses do |t|
      t.integer :subject_id
      t.integer :last_question_id
      t.integer :user_id
      t.integer :last_answer_id

      t.timestamps

    end
  end
end
