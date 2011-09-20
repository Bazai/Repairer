# encoding: utf-8
class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, :notice => "Вход произведен успешно!"
    else
      flash.now.alert = "Email или пароль не верный"
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to root_url, :notice => "Выход произведен!"
  end

end
