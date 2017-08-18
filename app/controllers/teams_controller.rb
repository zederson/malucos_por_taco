class TeamsController < ApplicationController
  def index
    @teams = Team.all.decorate
  end
end
