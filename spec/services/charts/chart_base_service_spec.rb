require 'rails_helper'

RSpec.describe Charts::ChartBaseService do
  let(:matches) { [1, 2, 3] }
  let(:options) { { name: 'Taco' } }
  let(:instance) { Charts::ChartBaseService.new(matches, options) }

  describe '#size' do
    subject { instance.size }
    it { is_expected.to be 3 }
  end
end
