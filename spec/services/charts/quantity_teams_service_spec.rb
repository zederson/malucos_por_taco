require 'rails_helper'
require 'support/database'

RSpec.describe Charts::QuantityTeamsService do
  include Database

  before(:all) { Rails.application.load_seed }
  after(:all) { clear_database }

  let(:matches) { Match.all }
  let(:instance) { Charts::QuantityTeamsService.new(matches) }

  describe '#size' do
    subject { instance.size }
    it { is_expected.to be matches.size }
  end

  describe '#run' do
    subject { instance.run }

    let(:result) do
      {
        data: [
          { name: 'Zé - Marco',        y: 8 },
          { name: 'Tacudo - Vando',    y: 2 },
          { name: 'Tacudo - Anselmo',  y: 1 },
          { name: 'Felipe - Vando',    y: 1 },
          { name: 'Adriano - Tacudo',  y: 1 },
          { name: 'Anselmo - Felipe',  y: 5 },
          { name: 'Adriano - Zé',      y: 1 },
          { name: 'Adriano - Marco',   y: 1 },
          { name: 'Anselmo - Matheus', y: 2 },
          { name: 'Felipe - Fábio',    y: 3 },
          { name: 'Felipe - Matheus',  y: 1 }
        ]
      }
    end

    it { is_expected.to eq(result) }
  end
end
