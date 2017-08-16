class Scout < ApplicationRecord
  belongs_to :team
  belongs_to :match

  def score
    (run || 0) * 2
  end

  def winner?
    match.winner?(self)
  end
end
