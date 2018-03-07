class Question < ApplicationRecord
  # Direct associations

  has_many   :outcomes,
             :foreign_key => "prereq_question_id"

  # Indirect associations

  # Validations

end
