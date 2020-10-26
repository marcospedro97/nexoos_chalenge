class CreditSolicitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :validates_user_applicant

  def index
    @credit_solicitation = CreditSolicitation
                           .with_open_plots(params[:applicant_id])
  end

  def new
    @plot_taxes = PlotTax.all
    @credit_solicitation = CreditSolicitation
                           .new(applicant_id: params[:applicant_id])
  end

  def create
    @credit_solicitation = CreditSolicitation.new(credit_solicitation_params)
    if @credit_solicitation.save
      return redirect_to(applicant_credit_solicitations_path(
                           @credit_solicitation.applicant
                         ),
                         notice: 'Solicitação criada')
    end
    @plot_taxes = PlotTax.all
    render :new
  end

  private

  def validates_user_applicant
    @applicant = Applicant.where(user: current_user, id: params[:applicant_id])
    redirect_to root_path if @applicant.empty?
  end

  def credit_solicitation_params
    params.require(:credit_solicitation)
          .permit(:value, :plot_tax_id, :applicant_id)
  end
end
