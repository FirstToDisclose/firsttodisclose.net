class RevisionsController < ApplicationController
  def index
    @revisions = Revision.where("innovation_id = ?", params[:innovation_id]).order(:created_at)
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @revisions }
    end
  end

  def show
    @revision = Revision.find(params[:id])
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::Safe, safe_links_only: true, escape_html: true, no_styles: true)
    @markdown_abstract = markdown.render(@revision.abstract).html_safe
    @markdown_body = markdown.render(@revision.body).html_safe
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @revision }
    end
  end
end
