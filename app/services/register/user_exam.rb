module Register
  class UserExam < ApplicationService
    attr_reader :params, :college, :exam, :user

    include Validate

    def initialize(params)
      @params = params
      find_exam
      find_college
      find_user
    end

    def assign_exam
      validate_exam_college(exam, college)

      return 'Exam Already Registered!' if user.exams.find_by(id: exam.id).present?

      user.exams << exam
      'Exam Registerd Successfully!'
    end

    private

    def find_exam
      @exam = Exam.find_by(id: params[:exam_id])
      raise_exception(message: 'No Exam found!') unless @exam
      exam_window = exam.exam_window
      if exam_window.start_time <= params[:start_time].to_time && params[:start_time].to_time < exam_window.end_time
        return
      end

      raise_exception(message: 'No Exam found with in the Start Time!')
    end

    def find_college
      @college = College.find_by(id: params[:college_id])
      raise_exception(message: 'No College Found') unless @college
    end

    def find_user
      @user = User.find_or_create_by(first_name: params[:first_name], last_name: params[:last_name],
                                     phone_no: params[:phone_no], college_id: college.id)
    end
  end
end
