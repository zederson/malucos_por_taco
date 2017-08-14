class Match < ApplicationRecord
  has_many :scouts
  accepts_nested_attributes_for :scouts
  scope :recents, -> { order(:started_at) }

  def winner
    scouts.sort_by(&:run).last
  end

  def winner?(scout)
    winner == scout
  end
end
