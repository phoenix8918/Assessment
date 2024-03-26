# frozen_string_literal: true

class ApplicationService
  def raise_exception(message: 'Try again Later!')
    raise StandardError, message
  end
end
