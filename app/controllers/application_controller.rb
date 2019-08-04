class ApplicationController < ActionController::Base
  Rails.application.routes.default_url_options[:host] = "fathomless-dawn-98779.herokuapp.com"###
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in'
      redirect_to login_path
    end
   end


end

