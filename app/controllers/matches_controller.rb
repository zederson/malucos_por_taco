class MatchesController < ApplicationController

  def index
  end

  def new
    initialize_match
  end

  def create
    match = Match.new(match_params)
    binding.pry
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
