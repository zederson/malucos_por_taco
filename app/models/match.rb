class Match < ApplicationRecord
  has_many :scouts
  accepts_nested_attributes_for :scouts
end
