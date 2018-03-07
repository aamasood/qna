class Subject < ApplicationRecord
  # Direct associations

  has_many   :questions,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
