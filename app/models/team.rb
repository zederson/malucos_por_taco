class Team < ApplicationRecord
  has_many :integrants
  has_many :players, -> { order(:name) }, through: :integrants
  has_many :scouts
  has_many :matches, through: :scouts

  def title
    players.map(&:title).join(' - ')
  end
end
