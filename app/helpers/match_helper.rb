module MatchHelper
  def match_dates_options
    dates    = Match.pluck(:started_at)
    options  = dates.map do |start|
      start.strftime '%d/%m/%Y'
    end
    options.uniq.map { |d| [d, d] }
  end
end
