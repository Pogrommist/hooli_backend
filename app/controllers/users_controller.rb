class UsersController < ApplicationController 
   before_action :authenticate_user!, only: [:show, :upload_avatar]
    def show 
        render json: current_user
    end

    def upload_avatar
        avatar = Cloudinary::Uploader.upload(params[:avatar_url], :folder => "users_avatars")

        current_user.update(avatar_url: avatar["secure_url"])

        render json: current_user
    end
end