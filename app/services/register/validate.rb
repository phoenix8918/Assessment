module Register
  module Validate
    def validate_exam_college(exam, college)
      raise_exception(message: 'No exams conducted in this college!') unless college.exams.find_by(id: exam.id)
    end
  end
end
