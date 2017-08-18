class TeamDecorator < Draper::Decorator
  delegate_all

  def matches_count
    @matches_count ||= matches.size
  end

  def total_score
    scouts.map(&:score).reduce(&:+)
  end

  def keys
    %i[back lost_ball bat_delivery house burned victory concierge]
  end

  def total_for(key)
    scouts.map(&key).reduce(&:+)
  end
end
