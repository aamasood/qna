class Answer < ApplicationRecord
  # Direct associations

  has_many   :user_statuses,
             :foreign_key => "last_answer_id"

  has_many   :outcomes,
             :dependent => :destroy

  belongs_to :question,
             :required => false

  # Indirect associations

  # Validations

  validates :response, :presence => true

end
