class Admin::InnovationsController < ApplicationController
  def index
    @innovations = Innovation.all
  end

  def show
    @innovation = Innovation.find(params[:id])
    @review = Review.new
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::Safe, safe_links_only: true, escape_html: true, no_styles: true)
    @markdown_abstract = markdown.render(@innovation.abstract).html_safe
    @markdown_body = markdown.render(@innovation.body).html_safe
  end

  def update
    @innovation = Innovation.find(params[:id])
    if @innovation.update(hidden: !@innovation.hidden?)
      @innovation.send_notification
      flash[:notice] = "Innovation Status Updated"
      redirect_to admin_innovation_path(@innovation)
    else
      render admin_innovation_path(@innovation)
    end
  end
end
