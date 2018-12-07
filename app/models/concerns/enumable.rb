module Enumable
  extend ActiveSupport::Concern

  class_methods do
    def i18n_enum(enum, value = nil)
      I18nEnum.new(name, enum, value)
    end
  end

  included do
    defined_enums.keys.each do |attribute|
      define_method "#{attribute}_human_value" do
        return if send(attribute).blank?

        self.class.i18n_enum(attribute, send(attribute)).human_value
      end

      define_method "#{attribute}_for_select" do
        self.class.i18n_enum(attribute).for_select
      end

      define_method "#{attribute}_default" do
        self.class.i18n_enum(attribute).default
      end

      singleton_class.instance_eval do
        define_method "#{attribute}_for_select" do
          i18n_enum(attribute).for_select
        end

        define_method "#{attribute}_default" do
          i18n_enum(attribute).default
        end
      end
    end
  end
end
