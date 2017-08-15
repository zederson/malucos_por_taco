require 'rails_helper'

RSpec.describe Builder::Match do
  let(:match) { Builder::Match.build_match }

  before do
    match.scouts.first.run = 5
    match.scouts.last.run = 12
  end

  describe '#winner' do
    subject { match }
    it { expect(match.winner.run).to be 12 }
  end

  describe '#winner?' do
    let(:match) { create(:complete_match) }
    it { expect(match.winner?(match.scouts.first)).to be_truthy }
    it { expect(match.winner?(match.scouts.second)).to be_falsey }
  end
end
