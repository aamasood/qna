class User < ApplicationRecord
  # Direct associations

  belongs_to :company

  has_many   :user_responses,
             :dependent => :destroy

  has_many   :user_statuses,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :uniqueness => { :scope => [:company_id] }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
