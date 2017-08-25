require 'rails_helper'
require 'support/database'

RSpec.describe Charts::QuantityScoutService do
  include Database

  before(:all) { Rails.application.load_seed }
  after(:all) { clear_database }

  let(:matches) { Match.all }
  let(:instance) { Charts::QuantityScoutService.new(matches) }

  describe '#size' do
    subject { instance.size }
    it { is_expected.to be matches.size }
  end

  describe '#run' do
    subject { instance.run }

    let(:result) do
      {
        items: [
          { name: 'Zé - Marco',        data: [76, 26, 2, 5, 7, 1, 1, 5] },
          { name: 'Tacudo - Vando',    data: [0,  0,  0, 0, 0, 0, 0, 0] },
          { name: 'Tacudo - Anselmo',  data: [9,  6,  0, 0, 2, 0, 0, 5] },
          { name: 'Felipe - Vando',    data: [8,  7,  0, 0, 2, 0, 0, 0] },
          { name: 'Adriano - Tacudo',  data: [4,  2,  0, 0, 2, 0, 0, 1] },
          { name: 'Anselmo - Felipe',  data: [40, 13, 1, 2, 2, 2, 0, 2] },
          { name: 'Adriano - Zé',      data: [10, 3,  1, 0, 0, 0, 0, 0] },
          { name: 'Adriano - Marco',   data: [6,  8,  0, 0, 0, 1, 1, 2] },
          { name: 'Anselmo - Matheus', data: [7,  2,  1, 7, 2, 4, 0, 0] },
          { name: 'Felipe - Fábio',    data: [39, 4,  0, 7, 3, 2, 2, 0] },
          { name: 'Felipe - Matheus',  data: [13, 3,  0, 2, 0, 0, 0, 0] }
        ],
        categories: ['Corridas', 'Pra trás', 'Bolinha perdida',
                     'Entrega o taco', 'Casinha', 'Queimada',
                     'Vitória', 'Portaria']
      }
    end

    it { is_expected.to eq(result) }
  end
end
