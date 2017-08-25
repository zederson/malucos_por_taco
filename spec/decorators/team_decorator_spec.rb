require 'rails_helper'
require 'support/database'

RSpec.describe TeamDecorator do
  include Database
  before(:all) { Rails.application.load_seed }
  after(:all) { clear_database }

  let(:team) do
    p1 = Player.find_by(nick_name: 'Zé')
    p2 = Player.find_by(nick_name: 'Marco')
    teams = Team.joins(:integrants).where('integrants.player_id in (?)', [p1.id, p2.id])
    teams.select { |t| t.title == 'Zé - Marco' }.first
  end

  let(:decorator) { TeamDecorator.new(team) }

  describe '#matches_count' do
    subject { decorator.matches_count }
    it { is_expected.to be 8 }
  end

  describe '#total_score' do
    subject { decorator.total_score }
    it { is_expected.to be 152 }
  end

  describe '#total_winner' do
    subject { decorator.total_winner }
    it { is_expected.to be 5 }
  end

  describe '#total_loser' do
    subject { decorator.total_loser }
    it { is_expected.to be 3 }
  end

  describe '#keys' do
    let(:keys) { %i[back lost_ball bat_delivery house burned victory concierge] }
    subject { decorator.keys }
    it { is_expected.to eq keys }
  end

  describe '#total_for' do
    subject { decorator.total_for :back }
    it { is_expected.to be 26 }
  end
end
