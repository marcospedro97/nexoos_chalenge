class ApplicantsController < ApplicationController
  before_action :authenticate_user!

  def show
    @applicant = Applicant.find(params[:id])
  end

  def new
    @applicant = Applicant.new
    @applicant.addresses.build
    @applicant.phones.build
  end

  def create
    @applicant = Applicant.new(applicant_params)
    @applicant.user = current_user
    if @applicant.save
      return redirect_to @applicant, notice: 'Empresa cadastrada'
    end

    render :new
  end

  private

  def applicant_params
    params.require(:applicant)
          .permit(:social_name, :cnpj, phones_attributes: %i[number],
                                       addresses_attributes: %i[street number
                                                                complement])
  end
end
