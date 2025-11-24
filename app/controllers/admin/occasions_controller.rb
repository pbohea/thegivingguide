class Admin::OccasionsController < Admin::BaseController
  before_action :set_occasion, only: [:show, :edit, :update, :destroy]

  def index
    @occasions = Occasion.order(:name)
  end

  def show
  end

  def new
    @occasion = Occasion.new
  end

  def create
    @occasion = Occasion.new(occasion_params)

    if @occasion.save
      redirect_to admin_occasions_path, notice: "Occasion created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @occasion.update(occasion_params)
      redirect_to admin_occasions_path, notice: "Occasion updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @occasion.destroy
    redirect_to admin_occasions_path, notice: "Occasion deleted successfully!"
  end

  private

  def set_occasion
    @occasion = Occasion.find(params[:id])
  end

  def occasion_params
    params.require(:occasion).permit(:name, :description)
  end
end
