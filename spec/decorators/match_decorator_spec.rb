require 'rails_helper'

RSpec.describe MatchDecorator do
  let(:match)     { create(:match) }
  let(:decorator) { MatchDecorator.new(match) }

  describe '#players_for_select' do
    before { create_list(:player, 3) }

    subject  { decorator.players_for_select.size }

    it { is_expected.to be 3 }
  end

  describe '#title_for_first_team' do
    let(:match)   { create(:complete_match) }
    let(:players) { match.scouts.first.team.players }
    let(:title)   { "<div>#{players.first.title} - #{players.last.title}</div>" }

    subject { decorator.title_for_first_team }

    context 'when looser' do
      before { expect(match).to receive(:winner?).and_return(false) }
      it { is_expected.to eq title }
    end

    context 'when winner' do
      let(:title)   { "<div><i class=\"fa fa-trophy text-success\"></i>#{players.first.title} - #{players.last.title}</div>" }
      before { expect(match).to receive(:winner?).and_return(true) }
      it { is_expected.to eq title }
    end
  end
end
