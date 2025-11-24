class Admin::DashboardController < Admin::BaseController
  def index
    @gift_guides_count = GiftGuide.count
    @products_count = Product.count
    @occasions_count = Occasion.count
    @experiences_count = Experience.count
    @consultation_requests_count = ConsultationRequest.count
  end
end
