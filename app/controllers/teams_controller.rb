class TeamsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @team = Team.new
  end

  def create
    @event = Event.find(params[:event_id])
    @team = current_user.teams.build(team_params)
    @team.event = @event
    if @team.save
      flash[:notice] = "Team created"
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
