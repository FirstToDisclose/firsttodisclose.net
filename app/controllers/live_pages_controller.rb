class LivePagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :check_if_admin, only: [:new, :create]

  def index
    @hangout = LivePage.last
  end

  def new
    @live_page = LivePage.new
  end

  def create
    @live_page = LivePage.new(live_page_params)
    if @live_page.save
      flash[:notice] = "Hangout Added"
      redirect_to live_pages_path
    else
      render :new
    end
  end

  private

  def live_page_params
    params.require(:live_page).permit(:hangout_url)
  end

  def check_if_admin
    if !current_user.admin?
      flash[:notice] = "You don't have permission to do that"
      redirect_to root_path
    end
  end
end
