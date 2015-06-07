class InnovationTagsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @innovation = Innovation.find(params[:innovation_id])
    binding.pry
    if @innovation.create_tags(params[:innovation_tags], get_tag_set)
      flash[:notice] = "Tags Applied"
      redirect_to @innovation
    else
      render @innovation
    end
  end

  private

  def get_tag_set
    if current_user.admin? || current_user == @innovation.user
      TagSet.find_by(title: "FirstToDisclose")
    else
      TagSet.find_by(title: "Community")
    end
  end
end
