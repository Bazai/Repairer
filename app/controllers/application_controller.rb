# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # Перехват исключения CanCan, если доступ запрещен
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
