class CreditSolicitationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @credit_solicitation = CreditSolicitation
                           .new(applicant_id: params[:applicant_id])
  end

  def create
    @credit_solicitation = CreditSolicitation.new(credit_solicitation_params)
    if @credit_solicitation.save
      return redirect_to(applicant_path(params[:applicant_id]),
                         notice: 'Solicitação criada')
    end

    render :new
  end

  private

  def credit_solicitation_params
    params.require(:credit_solicitation)
          .permit(:value, :plots_amount, :applicant_id)
  end
end
