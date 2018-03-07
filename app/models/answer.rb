class Answer < ApplicationRecord
  # Direct associations

  belongs_to :question,
             :required => false

  # Indirect associations

  # Validations

  validates :response, :presence => true

end
