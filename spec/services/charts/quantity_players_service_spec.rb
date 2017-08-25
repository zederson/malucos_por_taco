require 'rails_helper'
require 'support/database'

RSpec.describe Charts::QuantityPlayersService do
  include Database

  before(:all) { Rails.application.load_seed }
  after(:all) { clear_database }

  let(:matches) { Match.all }
  let(:instance) { Charts::QuantityPlayersService.new(matches) }

  describe '#size' do
    subject { instance.size }
    it { is_expected.to be matches.size }
  end

  describe '#run' do
    subject { instance.run }

    let(:result) do
      [
        { name: 'Zé',      y: 9 },
        { name: 'Marco',   y: 9 },
        { name: 'Tacudo',  y: 4 },
        { name: 'Vando',   y: 3 },
        { name: 'Anselmo', y: 8 },
        { name: 'Felipe',  y: 10 },
        { name: 'Adriano', y: 3 },
        { name: 'Matheus', y: 3 },
        { name: 'Fábio',   y: 3 }
      ]
    end

    it { is_expected.to eq(data: result) }
  end
end
