class SessionsController < ApplicationController
  def new
  end

  def create
    # find our user
    @user = User.find_by username: params[:username]
    # if password is correct
    if @user && @user.authenticate( params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    # sign them in
    else
      @message = 'There was something wrong with your username or password'
      render :new
    end
  end

  def delete
    reset_session
    redirect_to root_path
  end

end
