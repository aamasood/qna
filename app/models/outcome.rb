class Outcome < ApplicationRecord
  # Direct associations

  belongs_to :prereq_question,
             :class_name => "Question",
             :counter_cache => true

  # Indirect associations

  # Validations

end
