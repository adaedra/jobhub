# frozen_string_literal: true

class ApplicationController < ActionController::Base
  around_action :apply_locale

  def apply_locale(&action)
    locale = params[:locale]&.to_sym || I18n.default_locale
    locale = I18n.default_locale unless I18n.available_locales.include?(locale)
    I18n.with_locale(locale, &action)
  end
end
