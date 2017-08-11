class Player < ApplicationRecord
  has_many :integrants
  has_many :teams, through: :integrants

  validates :name, presence: true

  scope :recents, -> { order(:name) }
end
