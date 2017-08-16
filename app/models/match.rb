class Match < ApplicationRecord
  has_many :scouts
  accepts_nested_attributes_for :scouts
  scope :recents, -> { order(:started_at) }

  def winner
    scouts_ordered_run.last
  end

  def loser
    scouts_ordered_run.first
  end

  def winner?(scout)
    winner == scout
  end

  def scouts_ordered_run
    scouts.sort_by { |s| s.run || 0 }
  end
end
