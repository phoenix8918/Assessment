class College < ApplicationRecord
  has_many :users
  has_and_belongs_to_many :exams

  validates :name, presence: true
end
