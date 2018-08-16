class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]

  def new
    render :new
  end

  def create
    # debugger
    user = User.find_by_credientials(params[:user][:email], params[:user][:password])
    if user
      log_in_user!(user)
      redirect_to bands_url
    else
      flash.now[:errors] = ['Crediential cannot be found!']
      render :new
    end

  end

  def destroy
    log_out!
    redirect_to new_session_url
  end
end
