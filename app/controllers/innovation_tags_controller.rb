class InnovationTagsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :verify_admin, only: :destroy
  before_filter :set_tag_set

  def create
    @innovation = Innovation.find(params[:innovation_id])
    if @innovation.create_tags(params[:innovation_tags],
                               @tag_set, current_user)
      flash[:notice] = "Tags Applied"
      redirect_to @innovation
    else
      render @innovation
    end
  end

  def destroy
    @innovation_tag = InnovationTag.find(params[:id])
    @innovation = @innovation_tag.innovation
    if @innovation_tag.destroy
      flash[:notice] = "Tag Removed"
      redirect_to admin_innovation_path(@innovation)
    else
      render admin_innovation_path(@innovation)
    end
  end

  private

  def set_tag_set
    @tag_set = TagSet.find_by(title: "Community")
  end

  def verify_admin
    if !current_user.admin?
      redirect_to innovations_path
    end
  end
end
