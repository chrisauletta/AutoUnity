class SessionsController < ApplicationController
 before_action :block_access, except: [:destroy]
 
    def create  
      @user = User.find_by(login: params[:session][:login].downcase)
   if @user.password_digest == (params[:session][:password])
      sign_in(@user)
      redirect_to dashboard_path
	else
      render 'new'
      end
    end

   def destroy
      sign_out
      redirect_to root_url
    end

  

end
