class SearchController < ApplicationController
  def index
    if params[:search]
      search_return = Innovation.basic_search(params[:search])
      if search_return == []
        @innovations = nil
      else
        @innovations = search_return
      end
    end
    render "/innovations/index"
  end
end
