# frozen_string_literal: true

class ApiController < ActionController::API
  include ExceptionHandlerable

  private

  def params_h
    params.to_unsafe_h
  end

  def render_errors(errors = {}, status = :bad_request)
    render json: { errors: errors }, status: status
  end

  def render_silent_success
    head :no_content
  end
end
