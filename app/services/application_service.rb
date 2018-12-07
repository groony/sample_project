class ApplicationService < Performify::Base
  def initialize(*params)
    params = params.try(:first).try(:deep_symbolize_keys) || {}
    @current_user = params.delete(:current_user)
    @args = params

    prepare_instance

    fail!(with_callbacks: false) if errors?
  end
end
