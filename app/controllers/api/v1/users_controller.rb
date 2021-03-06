class Api::V1::UsersController < ApplicationController
  #user can't be authenticated if they don't exist
  skip_before_action :authorized, only: [:create]
    
    def create
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token({ user_id: @user.id }) #from app_controller
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: @user.errors.full_messages }, status: :not_acceptable
      end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
