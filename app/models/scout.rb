class Scout < ApplicationRecord
  belongs_to :team
  belongs_to :match

  def score
    (run || 0) * 2
  end

  def winner?
    match.winner?(self)
  end

  def loser?
    !winner?
  end

  def self.keys
    %i[run back lost_ball bat_delivery house burned victory concierge]
  end
end
