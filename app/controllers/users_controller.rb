class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      render json: { status: 'User created successfully' }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      render json: { token: encode_token(@user.id) }, status: :ok
    else
      render json: { errors: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def encode_token(user_id)
    JWT.encode({ user_id: user_id }, Rails.application.secrets.secret_key_base, 'HS256')
  end
end
