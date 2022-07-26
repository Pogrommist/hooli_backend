class UsersController < ApplicationController 
	before_action :authenticate_user!, only: [:show, :upload_avatar, :update_user_info]

	def show 
			render json: current_user
	end

	def upload_avatar
		avatar = Cloudinary::Uploader.upload(params[:avatar_url], :folder => "users_avatars")

		current_user.update(avatar_url: avatar["secure_url"])

		render json: current_user
	end

	def update_user_info
		current_user.update(params_user)

		render json: current_user
	end

	private

	def params_user
		params.require(:user).permit(:first_name, :last_name)
	end

end