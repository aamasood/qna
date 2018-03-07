class Question < ApplicationRecord
  # Direct associations

  has_many   :answers

  has_many   :question_outcomes,
             :class_name => "Outcome",
             :foreign_key => "resulting_question_id"

  has_many   :outcomes,
             :foreign_key => "prereq_question_id"

  # Indirect associations

  # Validations

end
