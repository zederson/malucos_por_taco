class Team < ApplicationRecord
  has_many :integrants
  has_many :players, -> { order(:name) }, through: :integrants

  def title
    players.map(&:title).join(' - ')
  end
end
