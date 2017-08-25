require 'rails_helper'

RSpec.describe MatchHelper, type: :helper do
  describe '.match_dates_options' do
    let(:start) { Match.last.started_at.strftime '%d/%m/%Y' }
    subject { helper.match_dates_options }
    before { create_list(:match, 3) }

    it { is_expected.to include [start, start] }
  end
end
