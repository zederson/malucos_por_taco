class Team < ApplicationRecord
  has_many :integrants
  has_many :players, -> { order(:name) }, through: :integrants
end
