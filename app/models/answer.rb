class Answer < ApplicationRecord
  # Direct associations

  has_many   :outcomes,
             :dependent => :destroy

  belongs_to :question,
             :required => false

  # Indirect associations

  # Validations

  validates :response, :presence => true

end
