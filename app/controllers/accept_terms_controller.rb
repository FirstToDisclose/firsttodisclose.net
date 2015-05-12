class AcceptTermsController < ApplicationController
  before_filter :check_if_accepted_terms
  before_filter :check_params

  def edit
  end

  def update	
    Rails.logger.info "#{current_user.email} has accepted the terms"
    if current_user.update(accepted_terms: true, accepted_terms_time; DateTime.now)
      redirect_to '/innovations/new'
    else
      render :edit
    end
  end

  private

  def check_if_accepted_terms
    if current_user.accepted_terms
      redirect_to root_path
    end
  end
  
  def check_params
    unless params[:Accept]
      redirect_to :edit
    end
  end
end
