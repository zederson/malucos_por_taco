class Team < ApplicationRecord
  has_many :integrants
  has_many :players, through: :integrants

  accepts_nested_attributes_for :players
end
