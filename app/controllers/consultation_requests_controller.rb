class ConsultationRequestsController < ApplicationController
  def new
    @consultation_request = ConsultationRequest.new
  end

  def create
    @consultation_request = ConsultationRequest.new(consultation_request_params)
    @consultation_request.user = current_user if user_signed_in?

    if @consultation_request.save
      # TODO: Send notification email to admin
      redirect_to root_path, notice: "Thank you! We'll be in touch soon to schedule your consultation."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def consultation_request_params
    params.require(:consultation_request).permit(:name, :email, :phone, :message, :preferred_contact_method, :budget_range)
  end
end
