class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :inquiry
      t.integer :subject_id
      t.boolean :high_level_question

      t.timestamps

    end
  end
end
