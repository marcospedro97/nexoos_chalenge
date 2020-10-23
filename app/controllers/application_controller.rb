class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    flash[:notice] = 'Recurso não encontrado'
    redirect_to root_path
  end
end
