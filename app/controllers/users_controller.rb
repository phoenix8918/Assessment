class UsersController < ApplicationController
  def assign_exam
    message = Register::UserExam.new(user_params).assign_exam
    render_success(message: message)
  rescue StandardError => e
    unprocessable_entity(e.message)
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :phone_no, :college_id, :exam_id, :start_time)
    end
end
