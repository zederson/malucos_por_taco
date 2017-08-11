class Scout < ApplicationRecord
  belongs_to :team
  belongs_to :match
  accepts_nested_attributes_for :team
end
