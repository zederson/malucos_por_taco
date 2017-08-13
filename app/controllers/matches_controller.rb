class MatchesController < ApplicationController
  def index
    @matches = Match.recents.decorate
  end

  def new
    initialize_match
  end

  def create
    scouts = ('a'..'b').map { |v| scout_params v }
    teams  = ('a'..'b').map { |v| player_params v }
    @match = Match::CreatorService.new(match_params, scouts, teams).create

    if @match
      flash[:success] = 'Cadastro realizado com sucesso'
      redirect_to matches_path
    else
      render :new
    end
  end

  private

  def initialize_match
    @match = Builder::Match.build_match.decorate
  end

  def match_params
    dates = (1..5).map {|i| ["started_at(#{i}i)", "finished_at(#{i}i)"] }
    params.require(:match).permit(dates.flatten)
  end

  def player_params(team)
    params.require("player_#{team}").permit('1': [:id], '2': [:id])
  end

  def scout_params(team)
    params.require("scout_#{team}").permit(:run, :back, :lost_ball, :bat_delivery, :house, :burned, :victory, :concierge)
  end
end
