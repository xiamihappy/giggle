class SessionsController < ApplicationController
  layout "admin"  
  def new
    render 'new'  
  end

  def create
    admin = Admin.find_by(name: params[:session][:name].downcase)
    if admin && admin.authenticate(params[:session][:password])
      sign_in admin
      redirect_to admin
    else
      flash.now[:error] = 'Invalid name/passowrd'
      render 'new'
    end
  end 

  def destroy
    sign_out
    redirect_to signin_path
  end
end
