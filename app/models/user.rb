class User < ApplicationRecord
  belongs_to :college

  has_and_belongs_to_many :exams

  validates :first_name, :last_name, :phone_no, presence: true
end
