class UserResponse < ApplicationRecord
  # Direct associations

  belongs_to :answer

  belongs_to :question,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
