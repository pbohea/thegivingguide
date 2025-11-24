class Admin::GiftGuidesController < Admin::BaseController
  before_action :set_gift_guide, only: [:show, :edit, :update, :destroy]

  def index
    @gift_guides = GiftGuide.unscoped.order(position: :asc)
  end

  def show
  end

  def new
    @gift_guide = GiftGuide.new
    @occasions = Occasion.all
  end

  def create
    @gift_guide = GiftGuide.new(gift_guide_params)
    @gift_guide.position = (GiftGuide.maximum(:position) || 0) + 1

    if @gift_guide.save
      redirect_to admin_gift_guides_path, notice: "Post created successfully!"
    else
      @occasions = Occasion.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @occasions = Occasion.all
  end

  def update
    if @gift_guide.update(gift_guide_params)
      redirect_to admin_gift_guides_path, notice: "Post updated successfully!"
    else
      @occasions = Occasion.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @gift_guide.destroy
    redirect_to admin_gift_guides_path, notice: "Post deleted successfully!"
  end

  private

  def set_gift_guide
    @gift_guide = GiftGuide.unscoped.find(params[:id])
  end

  def gift_guide_params
    params.require(:gift_guide).permit(:caption, :image, :occasion_id, :position)
  end
end
