class LoginsController < ApplicationController
  
  def new
  end
  
  def create
    chef = Chef.find_by(email: params[:email])
    if(chef && chef.authenticate(params[:password]))
      session[:chef_id] = chef.id
      flash[:success] = "You logged in"
      redirect_to chef_path(chef)
    else
      flash.now[:danger] = "Your email or password incorrect"
      redirect_to login_path
    end
  end
  
  def destroy
    session[:chef_id] = nil
    redirect_to login_path
  end
  
end