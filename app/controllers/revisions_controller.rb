class RevisionsController < ApplicationController
  def index
    @revisions = Revision.where("innovation_id = ?", params[:innovation_id]).order(:created_at)
  end

  def show
    @revision = Revision.find(params[:id])
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::Safe, safe_links_only: true, escape_html: true, no_styles: true)
    @markdown_abstract = markdown.render(@revision.abstract).html_safe
    @markdown_body = markdown.render(@revision.body).html_safe
  end
end
