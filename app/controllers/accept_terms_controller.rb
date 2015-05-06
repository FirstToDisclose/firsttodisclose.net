class AcceptTermsController < ApplicationController
	before_filter :check_if_accepted_terms
	
	def edit
	end

	def update	
		if params[:Accept]
			Rails.logger.info "that's consent"
			current_user.accepted_terms = true
			current_user.accepted_terms_time = DateTime.now
			current_user.save
			redirect_to '/innovations/new'
		end
	end

	private
	def check_if_accepted_terms
	    if current_user.accepted_terms
			redirect_to root_path
		end
  	end
end
