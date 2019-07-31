class ApplicationController < ActionController::Base
  Rails.application.routes.default_url_options[:host] = "intense-anchorage-62079.herokuapp.com"###
  protect_from_forgery with: :exception
  include SessionsHelper
end
