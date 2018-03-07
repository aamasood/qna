class UserStatus < ApplicationRecord
  # Direct associations

  belongs_to :subject

  belongs_to :last_answer,
             :required => false,
             :class_name => "Answer"

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
