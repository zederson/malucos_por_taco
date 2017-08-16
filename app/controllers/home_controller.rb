class HomeController < ApplicationController
  def index
    matches = Match::SearchService.by_started(search_param)
    @matches = HomeDecorate.decorate(matches)
  end

  private

  def search_param
    params.dig(:q, :started_at)
  end
end
