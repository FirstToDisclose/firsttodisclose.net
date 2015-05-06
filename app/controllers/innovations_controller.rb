class InnovationsController < ApplicationController
  before_action :set_innovation, only: [:show, :edit, :update, :destroy]
  before_action :check_ownership, only: [:edit, :update, :destroy]
  before_action :clone_innovation, only: [:update, :destroy]
  before_action :check_if_hidden, only: [:show]
  before_filter :check_privileges!, only: [:new, :create, :edit, :save]
  before_filter :accepted_terms, only: [:new, :create]

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

  # GET /innovations
  # GET /innovations.json
  def index
      @innovations = Innovation.visible
      respond_to do |format|
        format.html { render :index }
        format.json { render json: @innovations }
      end
  end

  # GET /innovations/1
  # GET /innovations/1.json
  def show
    @review = Review.new
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::Safe, safe_links_only: true, escape_html: true, no_styles: true)
    @markdown_abstract = markdown.render(@innovation.abstract).html_safe
    @markdown_body = markdown.render(@innovation.body).html_safe
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @innovation }
    end
  end

  # GET /innovations/new
  def new
    @innovation = current_user.innovations.new
  end

  # GET /innovations/1/edit
  def edit
  end

  # POST /innovations
  # POST /innovations.json
  def create
    @innovation = current_user.innovations.new(innovation_params)
    respond_to do |format|
      if @innovation.save && @innovation.create_tags(params)
        format.html { redirect_to @innovation, notice: 'Innovation was successfully created.' }
        format.json { render json: @innovation, status: :created, location: innovation_path(@innovation) }
      else
        format.html { render :new }
        format.json { render json: @innovation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /innovations/1
  # PATCH/PUT /innovations/1.json
  def update
    respond_to do |format|
      if @innovation.update(innovation_params)
        format.html { redirect_to @innovation, notice: 'innovation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @innovation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /innovations/1
  # DELETE /innovations/1.json
  def destroy
    @innovation.destroy
    respond_to do |format|
      format.html { redirect_to innovations_url, notice: 'innovation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_innovation
      @innovation = Innovation.includes(:collections).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def innovation_params
      params.require(:innovation).permit(:title, :abstract, :body, :consented)
    end

    def clone_innovation
      @innovation.clone
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
end
