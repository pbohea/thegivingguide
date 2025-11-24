class OccasionsController < ApplicationController
  def index
    @occasions = Occasion.order(:name)
  end

  def show
    @occasion = Occasion.find(params[:id])
    @gift_guides = @occasion.gift_guides
  end
end
