class Player < ApplicationRecord
  has_many :integrants
  validates :name, presence: true
  scope :recents, -> { order(:name) }

  def title
    nick_name || name
  end
end
