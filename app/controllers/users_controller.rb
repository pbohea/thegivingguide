class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @user = current_user
    @experiences = @user.experiences.order(created_at: :desc).limit(5)
    @consultation_requests = @user.consultation_requests.order(created_at: :desc).limit(5)
  end
end
