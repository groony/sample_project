module Authenticatable
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  private

  def current_user
    @current_user ||= User.find_by(token: request.headers['X-Auth-Token'])
  end

  def signed_in?
    current_user.present?
  end

  def blocked?
    current_user.blocked?
  end

  def deleted?
    current_user.deleted?
  end
end
