class Admin::ExperiencesController < Admin::BaseController
  def index
    @experiences = Experience.includes(:user, :product, :gift_guide).order(created_at: :desc)
  end

  def show
    @experience = Experience.find(params[:id])
  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    redirect_to admin_experiences_path, notice: "Experience deleted successfully!"
  end
end
