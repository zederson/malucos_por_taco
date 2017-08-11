class MatchesController < ApplicationController

  def index
  end

  def new
    initialize_match
  end

  def create
  end

  private

  def initialize_match
    @match = Match.new.decorate
    2.times { @match.scouts.build }
    @match.scouts.each do |s|
      s.build_team
      2.times { s.team.players.build }
    end
  end
end
