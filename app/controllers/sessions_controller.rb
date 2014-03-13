class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user
      if user.authenticate(params[:session][:password])
        cookies.permanent.signed[:user_id] = user.id
      end
    end
    redirect_to root_path
  end

  def destroy
    cookies.delete :user_id
    redirect_to root_path
  end
end
