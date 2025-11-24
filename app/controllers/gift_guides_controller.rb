class GiftGuidesController < ApplicationController
  def index
    @gift_guides = GiftGuide.includes(:occasion).order(created_at: :desc)
  end

  def show
    @gift_guide = GiftGuide.find(params[:id])
    @products = @gift_guide.products
  end
end
