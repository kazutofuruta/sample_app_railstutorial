class ApplicationController < ActionController::Base
  Rails.application.routes.default_url_options[:host] = "warm-harbor-64190.herokuapp.com"###
  protect_from_forgery with: :exception
  include SessionsHelper
end
