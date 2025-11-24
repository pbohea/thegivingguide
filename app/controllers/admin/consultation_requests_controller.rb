class Admin::ConsultationRequestsController < Admin::BaseController
  def index
    @consultation_requests = ConsultationRequest.order(created_at: :desc)
  end

  def show
    @consultation_request = ConsultationRequest.find(params[:id])
  end

  def destroy
    @consultation_request = ConsultationRequest.find(params[:id])
    @consultation_request.destroy
    redirect_to admin_consultation_requests_path, notice: "Consultation request deleted successfully!"
  end
end
