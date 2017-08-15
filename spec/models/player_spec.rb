require 'rails_helper'

RSpec.describe Player do
  describe '#.title' do
    let(:player) { Player.new(name: 'Antonio Carlos', nick_name: 'Mussum') }
    subject { player.title }

    context 'when have a nick_name' do
      it { is_expected.to eq 'Mussum' }
    end

    context 'when dont have a nick_name' do
      let(:player) { Player.new(name: 'Antonio Carlos') }
      it { is_expected.to eq 'Antonio Carlos' }
    end

    context 'when nill' do
      let(:player) { Player.new }
      it { is_expected.to be_nil }
    end
  end
end
