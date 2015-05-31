class TeammatesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @team = Team.find(params[:team_id])
    @teammate = current_user.teammates.build(team: @team)
    if @teammate.save
      flash[:notice] = "Team membership requested. Your membership will be official once approved by the team leader"
      redirect_to team_path(@team)
    else
      render @team
    end
  end

  def index
    @team = Team.find(params[:team_id])
    @teammates = @team.teammates
  end

  def update
    @teammate = Teammate.find(params[:id])
    if @teammate.update(approved: !@teammate.approved)
      flash[:notice] = "Teammate approved"
      redirect_to team_path(@teammate.team)
    else
      render @teammate.team
    end
  end
end
