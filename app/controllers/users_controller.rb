class UsersController < ApplicationController
	before_action :authenticate_user!
 skip_before_filter :verify_authenticity_token

	def edit
		@user = current_user
	end
	def update
		@user = current_user

		if @user.update(user_params)
			flash[:notice] = "瞎改成功"
			redirect_to edit_user_path
		else
			render "edit"
		end
	end

	protected

	def user_params
		params.require(:user).permit(:time_zone)
	end
end