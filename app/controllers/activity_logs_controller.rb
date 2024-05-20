class ActivityLogsController < ApplicationController
  before_action :set_user

  def create
    @activity_log = @user.activity_logs.build(activity_log_params)
    if @activity_log.save
      render json: { status: 'Activity log created successfully' }, status: :created
    else
      render json: { errors: @activity_log.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    @activity_logs = @user.activity_logs
    render json: @activity_logs
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def activity_log_params
    params.require(:activity_log).permit(:url, :duration)
  end
end
