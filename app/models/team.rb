class Team < ApplicationRecord
  has_many :integrants
  has_many :players, through: :integrants
end
