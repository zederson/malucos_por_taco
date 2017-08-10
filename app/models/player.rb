class Player < ApplicationRecord
  validates :name, presence: true
  scope :recents, -> { order(:name) }
end
