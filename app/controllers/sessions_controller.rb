class SessionsController < ApplicationController

	def new
		
	end

  def create
	user = User.find_by(name: params[:user][:name])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:message] = 'We could not find a user with that username in our records or you entered the password incorrectly'
      redirect_to login_path
    end

    # redirect_to root_path
  end

  def destroy
  	
  end
end
