class MatchesController < ApplicationController
  include Match::ParamsService

  before_action :load_match, only: %i[edit update show]

  def index
    @matches = Match::SearchService.by_started(search_param).decorate
  end

  def new
    initialize_match
  end

  def create
    create_match
    if @match && @match.valid?
      flash[:success] = I18n.translate 'crud.create.success'
      redirect_to matches_path
    else
      render :new
    end
  end

  def update
    if update_match && @match.valid?
      flash[:success] = I18n.translate 'crud.edit.success'
      render :show
    else
      flash[:notice] = I18n.translate 'crud.edit.fail'
      render :edit
    end
  end

  private

  def load_match
    @match = Match.find(params[:id]).decorate
  end

  def update_match
    service = Match::UpdaterService.new(@match)
    service.update(match_params, parse_scouts, parse_teams)
  end

  def create_match
    scouts = parse_scouts
    teams  = parse_teams
    @match = Match::CreatorService.create(match_params, scouts, teams)
  end

  def search_param
    params.dig(:q, :started_at)
  end

  def initialize_match
    @match = Builder::Match.build_match.decorate
  end
end
