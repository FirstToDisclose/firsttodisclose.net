class InnovationTagsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_tag_set

  def create
    @innovation = Innovation.find(params[:innovation_id])
    if @innovation.create_tags(params[:innovation_tags], @tag_set)
      flash[:notice] = "Tags Applied"
      redirect_to @innovation
    else
      render @innovation
    end
  end

  private

  def set_tag_set
    @tag_set = TagSet.find_by(title: "Community")
  end
end
