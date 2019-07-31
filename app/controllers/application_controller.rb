class ApplicationController < ActionController::Base
  Rails.application.routes.default_url_options[:host] = "localhost:3000"###
  protect_from_forgery with: :exception
  include SessionsHelper
end
