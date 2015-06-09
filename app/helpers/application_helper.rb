module ApplicationHelper
	def devise_mapping
  		@devise_mapping ||= request.env["devise.mapping"]
	end

  def get_innovations(params)
    if !params[:search].blank?
      @innovations = search_innovations
    else
      @innovations = Innovation.visible.paginate(:page => params[:page], :per_page => 20)
    end
  end

  def search_innovations
    search_return = Innovation.visible.basic_search(params[:search])
    if search_return == []
      @innovations = nil
    else
      @innovations = search_return.paginate(:page => params[:page], :per_page => 20)
    end
  end
end
