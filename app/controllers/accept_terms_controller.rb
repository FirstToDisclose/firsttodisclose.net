class AcceptTermsController < ApplicationController
	before_filter :accepted_terms
	def accepted_terms
	    unless !current_user.accepted_terms
	      redirect_to '/'
    	end
  	end
  	
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
end
