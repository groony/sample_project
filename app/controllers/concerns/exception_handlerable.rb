module ExceptionHandlerable
  extend ActiveSupport::Concern

  included do
    rescue_from Exception, with: :unexpected_error_response

    rescue_from ActiveRecord::RecordNotFound do |_e|
      render_errors([{ message: 'resource not found' }], :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      Rails.logger.error(e.message)
      render_errors({ message: :unprocessable_entity }, :unprocessable_entity)
    end
  end

  private

  def unexpected_error_response(exception)
    logger = Logger.new('log/exceptions.log')
    logger.error(([exception.message] + exception.backtrace).join("\n"))
    render_errors({ message: 'something went wrong' }, :internal_server_error)
  end
end
