class AcceptTermsController < ApplicationController
	before_filter :check_if_terms_accepted
	
	def edit
	end

	def update		
		if params[:Accept]
			Rails.logger.info "that's consent"
			current_user.accepted_terms = true
			current_user.save
			redirect_to new_innovation_path
		end
	end
	
	private
	
	def check_if_terms_accepted
		if current_user.accepted_terms
			redirect_to root
		end
	end
end
