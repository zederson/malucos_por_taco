require 'rails_helper'

RSpec.describe Builder::Match do
  describe '.build_match' do
    let(:match) { Builder::Match.build_match }

    context 'scouts' do
      it { expect(match.scouts.size).to be 2 }
    end

    context 'team' do
      it { expect(match.scouts.first.team).not_to be_nil }
      it { expect(match.scouts.last.team).not_to be_nil }
    end

    context 'players' do
      it { expect(match.scouts.first.team.players.size).to be 2 }
      it { expect(match.scouts.last.team.players.size).to be 2 }
    end
  end
end
