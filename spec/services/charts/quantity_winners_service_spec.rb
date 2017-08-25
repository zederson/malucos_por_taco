require 'rails_helper'
require 'support/database'

RSpec.describe Charts::QuantityWinnersService do
  include Database

  before(:all) { Rails.application.load_seed }
  after(:all) { clear_database }

  let(:matches) { Match.all }
  let(:options) { { target: :players } }
  let(:instance) { Charts::QuantityWinnersService.new(matches, options) }

  describe '#size' do
    subject { instance.size }
    it { is_expected.to be matches.size }
  end

  describe '#run' do
    subject { instance.run }

    let(:result) do
      {
        data: [
          { name: 'Zé',       y: 5 },
          { name: 'Marco',    y: 5 },
          { name: 'Anselmo',  y: 4 },
          { name: 'Felipe',   y: 8 },
          { name: 'Fábio',    y: 3 },
          { name: 'Matheus',  y: 1 }
        ]
      }
    end

    it { is_expected.to eq(result) }

    context 'when no options' do
      let(:options) { nil }
      it { is_expected.to eq(data: []) }
    end
  end
end
