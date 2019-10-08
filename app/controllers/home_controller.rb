class HomeController < ApplicationController
  ALLOWALL = 'ALLOWALL'.freeze
  def index
    search
  end

  def show
    search
    response.headers['X-Frame-Options'] = ALLOWALL
    render layout: 'external'
  end

  private

  def search
    matches = Match::SearchService.by_started(search_param)
    @matches = HomeDecorator.decorate(matches)
  end

  def search_param
    params.dig(:q, :started_at)
  end
end
