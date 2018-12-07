class I18nEnum
  attr_reader :model, :enum, :value

  def initialize(model, enum, value = nil)
    return if enum.blank? || model.blank?

    @model = model.constantize
    @enum = enum.to_s
    @value = value
  end

  def default
    array.map { |k, v| [scope[k.to_sym], v] }
  end

  def for_select
    array.map { |k, _v| [scope[k.to_sym], k] }
  end

  def human_value
    scope[value.to_sym]
  end

  private

  def array
    @array ||= model.send(enum_plural).to_a
  end

  def scope
    @scope ||= I18n.t("activerecord.enums.#{klass_name}.#{enum_plural}", locale: :ru)
  end

  def enum_plural
    @enum_plural ||= enum.to_s.pluralize
  end

  def klass_name
    model.name.underscore
  end
end
