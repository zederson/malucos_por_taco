require 'rails_helper'
require 'support/database'

RSpec.describe HomeDecorator do
  include Database

  before(:all) { Rails.application.load_seed }
  after(:all) { clear_database }

  let(:matches) { Match.all }
  let(:decorator) { HomeDecorator.decorate matches }

  describe '#size' do
    subject { decorator.size }
    it { is_expected.to be matches.size }
  end

  describe '#players_winners' do
    subject { decorator.players_winners }
    let(:result) do
      [
        ['Felipe', 8],
        ['Marco', 5],
        ['Zé', 5],
        ['Anselmo', 4],
        ['Fábio', 3],
        ['Matheus', 1]
      ]
    end

    it { is_expected.to eq result }
  end

  describe '#players_losers' do
    subject { decorator.players_losers }
    let(:result) do
      [
        ['Anselmo', 4],
        ['Marco', 4],
        ['Tacudo', 4],
        ['Zé', 4],
        ['Adriano', 3],
        ['Vando', 3],
        ['Felipe', 2],
        ['Matheus', 2]
      ]
    end
    it { is_expected.to eq result }
  end

  describe '#count_players' do
    subject { decorator.count_players }
    it { is_expected.to be 9 }
  end

  describe '#teams_winner' do
    subject { decorator.teams_winner }
    let(:result) do
      [
        ['Zé - Marco', 5],
        ['Anselmo - Felipe', 4],
        ['Felipe - Fábio', 3],
        ['Felipe - Matheus', 1]
      ]
    end
    it { is_expected.to eq result }
  end

  describe '#teams_loser' do
    subject { decorator.teams_loser }
    let(:result) do
      [
        ['Zé - Marco', 3],
        ['Anselmo - Matheus', 2],
        ['Tacudo - Vando', 2],
        ['Adriano - Marco', 1],
        ['Adriano - Tacudo', 1],
        ['Adriano - Zé', 1],
        ['Anselmo - Felipe', 1],
        ['Felipe - Vando', 1],
        ['Tacudo - Anselmo', 1]
      ]
    end
    it { is_expected.to eq result }
  end

  describe '#charts' do
    subject { decorator.charts }
    it { is_expected.to be_an Charts::Service }
  end

  describe '#players_losers_zero' do
    subject { decorator.players_losers_zero }
    let(:result) do
      [
        ['Anselmo', 2],
        ['Tacudo', 2],
        ['Vando', 2],
        ['Felipe', 1],
        ['Matheus', 1]
      ]
    end
    it { is_expected.to eq result }
  end

  describe '#teams_loser_zero' do
    subject { decorator.teams_loser_zero }
    let(:result) do
      [
        ['Tacudo - Vando', 2],
        ['Anselmo - Felipe', 1],
        ['Anselmo - Matheus', 1]
      ]
    end
    it { is_expected.to eq result }
  end

  describe '.decorate' do
    subject { HomeDecorator.decorate([Match.new]) }
    it { is_expected.to be_an HomeDecorator }
  end
end
