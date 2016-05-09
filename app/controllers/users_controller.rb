class UsersController < ApplicationController

  def index
	@users= User.all
	# current_user = User.find_by_id(session[:current_user_id])
  end
  
  def show 
  	@user = User.find(params[:id])
  end 

def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to new_user_path
end
def new
  # behind the scenes does not require a view page in order to show a page and
  # avoid an error redirect to a get show / index 
    @user =User.new
end

def create  
	@user = User.new(user_parmas)
	# creating a new record in the system 
	if @user.save
		# saving the records 
		flash[:notice] = "You have joined the crew welome ."
		redirect_to user_path @user
		# redirecting to the show page for this user 
	else
		flash[:alert] = "There was a problem i think she re-evalute somethings in life ."
		redirect_to new_user_path
	end
end

def edit
    @user =User.find(params[:id]) 
end

def update
 @user = User.find(params[:id])
 @user.update(user_parmas) 
 redirect_to  user_path @user 
end 

private 

def user_parmas
params.require(:user).permit(:fname, :lname, :email, :password , :username)

end 

end 


