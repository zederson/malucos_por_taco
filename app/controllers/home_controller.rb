class HomeController < ApplicationController
  def index
    search
  end

  def show
    search
    render layout: 'external'
  end

  private

  def search
    matches = Match::SearchService.by_started(search_param)
    @matches = HomeDecorate.decorate(matches)
  end

  def search_param
    params.dig(:q, :started_at)
  end
end
