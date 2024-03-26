class ApplicationController < ActionController::API
  def render_success(message: nil)
    render_data(success: true, status: 200, message: message)
  end

  def unprocessable_entity(message)
    render_data(success: false, status: 400, message: message)
  end

  def render_data(success: false, status: 400, message: nil)
    render json: { success: success, message: message },
           status: status
  end
end
