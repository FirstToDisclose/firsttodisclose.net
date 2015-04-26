class Admin::InnovationsController < ApplicationController
  def index
    @innovations = Innovation.all
  end

  def update
    @innovation = Innovation.find(params[:id])
    if @innovation.update(hidden: !@innovation.hidden?)
      flash[:notice] = "Innovation Status Updated"
      redirect_to admin_innovations_path
    else
      render innovation_path(@innovation)
    end
  end
end
