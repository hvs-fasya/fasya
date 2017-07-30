class UsersController < ApplicationController

def index
	@users = User.all
end

def lock
	user = User.find(params[:id])
	user.lock_access!
	@users = User.all
	render :index
end

def unlock
	user = User.find(params[:id])
	user.unlock_access!
	@users = User.all
	render :index
end

def edit
	@user = User.find(params[:id])
end

def update
	@user = User.find(params[:id])
	@user.update_attributes(permitted_params([:user]))
	if(@user.save)
		flash[:notice] = "User successfully updated"
	else
		flash[:alert] = "Failed to update user"
	end
	render :show
end

def destroy
	user = User.find(params[:id])
	if(user.destroy)
		flash[:notice] = "User successfully destroyed"
	else
		flash[:alert] = "Failed to destroy user"
	end
	@users = User.all
	render :index
end

private

def permitted_params
    params.require(:user).permit(:nickname, :email)
end

end
