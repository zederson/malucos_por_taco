class TeamDecorator < Draper::Decorator
  delegate_all

  def matches_count
    @matches_count ||= matches.size
  end

  def total_score
    scouts.map(&:score).reduce(&:+)
  end

  def total_winner
    scouts.select(&:winner?).size
  end

  def total_loser
    scouts.select(&:loser?).size
  end

  def keys
    values = Scout.keys
    values.delete(:run)
    values
  end

  def total_for(key)
    scouts.map(&key).reduce(&:+)
  end
end
