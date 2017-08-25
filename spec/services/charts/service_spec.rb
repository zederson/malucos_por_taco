require 'rails_helper'

RSpec.describe Charts::Service do
  let(:matches) { [Match.new] }
  let(:instance) { Charts::Service.new(matches) }
  let(:mock) { double('Charts::Services') }

  before { expect(mock).to receive(:run).and_return(true) }

  describe '#pie_quantity_player' do
    subject { instance.pie_quantity_player }

    it 'forward to service' do
      expect(Charts::QuantityPlayersService)
        .to receive(:new).with(matches).and_return(mock)
      subject
    end
  end

  describe '#pie_quantity_team' do
    subject { instance.pie_quantity_team }

    it 'forward to service' do
      expect(Charts::QuantityTeamsService)
        .to receive(:new).with(matches).and_return(mock)
      subject
    end
  end

  describe '#pie_teams_winners' do
    subject { instance.pie_teams_winners }

    it 'forward to service' do
      expect(Charts::QuantityWinnersService)
        .to receive(:new).with(matches, target: :teams).and_return(mock)
      subject
    end
  end

  describe '#pie_players_winners' do
    subject { instance.pie_players_winners }

    it 'forward to service' do
      expect(Charts::QuantityWinnersService)
        .to receive(:new).with(matches, target: :players).and_return(mock)
      subject
    end
  end

  describe '#staked_bar' do
    subject { instance.staked_bar }

    it 'forward to service' do
      expect(Charts::QuantityScoutService)
        .to receive(:new).with(matches).and_return(mock)
      subject
    end
  end
end
