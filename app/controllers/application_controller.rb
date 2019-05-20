# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] ||
                  user_pref_locale ||
                  session[:locale] ||
                  location_detected_locale ||
                  header_detected_locale ||
                  I18n.default_locale

    session[:locale] = I18n.locale
  end

  def user_pref_locale
    current_user&.locale
  end

  def location_detected_locale
    # location = request.location
    # return unless location.present? && location.country_code.present?
    # return unless I18n.available_locales.include?(location.country_code)
    # location.country_code.include?("-") ? location.country_code : location.country_code.downcase
  end

  def header_detected_locale # rubocop:disable Metrics/AbcSize
    # rubocop:disable Metrics/LineLength
    return unless (request.env["HTTP_ACCEPT_LANGUAGE"] || "en").scan(/^[a-z]{2}/).first.present? && I18n.available_locales.include?((request.env["HTTP_ACCEPT_LANGUAGE"] || "en").scan(/^[a-z]{2}/).first)

    (request.env["HTTP_ACCEPT_LANGUAGE"] || "en").scan(/^[a-z]{2}/).first
    # rubocop:enable Metrics/LineLength
  end
end
