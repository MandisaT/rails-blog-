class SessionsController < ApplicationController

	def new   
	
	end

	def create
		
		@user = User.where(username: params[:username]).first
		
		if @user && @user.password == params[:password].to_i
		# check if @user.password matches with params[:password]
		session[:user_id] = @user.id
		flash[:notice] = "Hey welcome back to the crew , hope your out here shining !!!"
		# once logged in redirect
		redirect_to users_path
		# else flash error and redirect
		else
		flash[:alert] =	"did you forget your password again ?!"
		redirect_to login_path
			end
		end

	
	def destroy
		session[:user_id] =nil 
		flash[:notice] = "Logged Out"
		redirect_to login_path
	end 
end 
