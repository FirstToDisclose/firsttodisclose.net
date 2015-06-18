class InnovationsController < ApplicationController
  include ApplicationHelper

  before_action :set_innovation, only: [:show, :edit, :update, :destroy]
  before_action :check_ownership, only: [:edit, :update, :destroy]
  before_action :clone_innovation, only: [:update, :destroy]
  before_action :check_if_hidden, only: [:show]
  before_filter :check_privileges!, only: [:new, :create, :edit, :save]
  before_filter :accepted_terms, only: [:new, :create]
  before_filter :set_tag_set, only: [:create, :update]

  # GET /innovations
  def index
    @innovations = get_innovations(params)
  end

  # GET /innovations/1
  def show
    @review = Review.new
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::Safe, safe_links_only: true, escape_html: true, no_styles: true)
    @markdown_abstract = markdown.render(@innovation.abstract).html_safe
    @markdown_body = markdown.render(@innovation.body).html_safe
  end

  # GET /innovations/new
  def new
    @innovation = current_user.innovations.new
  end

  # GET /innovations/1/edit
  def edit
  end

  # POST /innovations
  def create
    @innovation = current_user.innovations.new(innovation_params)
    if @innovation.save && @innovation.create_tags(params[:innovation][:innovation_tags],
                                                   @tag_set, current_user)
      redirect_to @innovation, notice: 'Innovation was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /innovations/1
  def update
    if @innovation.update(innovation_params) && @innovation.create_tags(params[:innovation][:innovation_tags],
                                                                        @tag_set, current_user)
      redirect_to @innovation, notice: 'innovation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /innovations/1
  def destroy
    @innovation.destroy
    redirect_to innovations_url, notice: 'innovation was successfully destroyed.'
  end

  # Use callbacks to share common setup or constraints between actions.
  def check_privileges!
    if !user_signed_in?
      redirect_to "/users/sign_in", :notice =>  "You must have an account to submit innovations."
    end
  end

  def accepted_terms
    unless current_user.accepted_terms
      redirect_to '/accept_terms'
    end
  end

  def set_innovation
    @innovation = Innovation.includes(:collections).find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def innovation_params
    params.require(:innovation).permit(:title, :abstract, :body, :consented)
  end

  def clone_innovation
    @revision = @innovation.clone
    @revision.update(user: current_user)
  end

  def check_ownership
    unless current_user.admin? || @innovation.user == current_user
      flash[:notice] = "You don't have permission to do that"
      redirect_to innovation_path(@innovation)
    end
  end

  def check_if_hidden
    if @innovation.hidden?
      render "innovations/hidden"
    end
  end

  def set_tag_set
    @tag_set = TagSet.find_by(title: "FirstToDisclose")
  end
end
