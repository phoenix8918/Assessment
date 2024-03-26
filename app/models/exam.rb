
class Exam < ApplicationRecord
  belongs_to :exam_window

  has_and_belongs_to_many :users
  has_and_belongs_to_many :colleges
end
