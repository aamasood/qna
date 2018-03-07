class Outcome < ApplicationRecord
  # Direct associations

  belongs_to :resulting_question,
             :required => false,
             :class_name => "Question"

  belongs_to :prereq_question,
             :class_name => "Question",
             :counter_cache => true

  # Indirect associations

  # Validations

end
