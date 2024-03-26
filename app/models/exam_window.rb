class ExamWindow < ApplicationRecord
  has_many :exams

  validates :start_time, :end_time, presence: true
end

