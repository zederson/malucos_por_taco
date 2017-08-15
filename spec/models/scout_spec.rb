require 'rails_helper'

RSpec.describe Scout do
  describe '#score' do
    let(:scout) { Scout.new(run: 2) }
    subject { scout.score }

    context 'when have a running' do
      it { is_expected.to be 4 }
    end

    context 'when no have a running' do
      let(:scout) { Scout.new }
      it { is_expected.to be_zero }
    end
  end
end
