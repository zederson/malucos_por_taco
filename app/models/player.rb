class Player < ApplicationRecord
  has_many :integrants
  validates :name, presence: true
  scope :recents, -> { order(:name) }
end
