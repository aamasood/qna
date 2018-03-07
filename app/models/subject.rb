class Subject < ApplicationRecord
  # Direct associations

  has_many   :user_statuses,
             :dependent => :destroy

  has_many   :questions,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
