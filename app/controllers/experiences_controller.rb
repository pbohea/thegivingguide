class ExperiencesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @experiences = Experience.includes(:user, :product, :gift_guide).order(created_at: :desc)
  end

  def new
    @experience = Experience.new
    @products = Product.order(:name)
    @gift_guides = GiftGuide.order(:name)
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user

    if @experience.save
      redirect_to @experience, notice: "Thank you for sharing your experience!"
    else
      @products = Product.order(:name)
      @gift_guides = GiftGuide.order(:name)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @experience = Experience.find(params[:id])
  end

  private

  def experience_params
    params.require(:experience).permit(:content, :product_id, :gift_guide_id, :rating)
  end
end
