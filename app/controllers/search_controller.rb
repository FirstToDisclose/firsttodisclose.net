class SearchController < ApplicationController
  def index
    if params[:search]
      @results = Innovation.basic_search(params[:search])
    end
  end
end
