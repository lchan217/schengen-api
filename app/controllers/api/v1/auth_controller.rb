class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
      @user = User.find_by(email: user_login_params[:email])
      #User#authenticate comes from BCrypt
      if @user && @user.authenticate(user_login_params[:password])
        # encode token comes from ApplicationController
        token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
      elsif  user_login_params[:email] == ''
        render json: { error: 'Email cannot be blank' }, status: :unauthorized
      elsif user_login_params[:password] == ''
        render json: { error: 'Password cannot be blank' }, status: :unauthorized
      elsif !User.find_by(email: user_login_params[:email])
        render json: { error: 'User not found' }, status: :unauthorized
      else 
        render json: { error: 'Incorrect password' }, status: :unauthorized
      end
    end
  
    private
  
    def user_login_params
      params.require(:user).permit(:email, :password)
    end
end
