require 'rails_helper'
require 'support/database'

RSpec.describe PlayerDecorator do
  include Database

  before(:all) { Rails.application.load_seed }
  after(:all) { clear_database }

  let(:player) { Player.find_by name: 'Ederson de Lima' }
  let(:decorator) { PlayerDecorator.new(player) }

  describe '#total_teams' do
    subject { decorator.total_teams }
    it { is_expected.to be 2 }
  end

  describe '#total_matches' do
    subject { decorator.total_matches }
    it { is_expected.to be 9 }
  end

  describe '#total_winner' do
    subject { decorator.total_winner }
    it { is_expected.to be 5 }
  end

  describe '#total_loser' do
    subject { decorator.total_loser }
    it { is_expected.to be 4 }
  end
end
