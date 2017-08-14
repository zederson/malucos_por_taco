require 'rails_helper'

RSpec.describe MatchDecorator do
  let(:match)     { create(:match) }
  let(:decorator) { MatchDecorator.new(match) }

  describe '#score_first_team' do
    let(:match) { create(:complete_match) }
    let(:score) { match.scouts.first.score.to_s }

    subject  { decorator.score_first_team }

    it { is_expected.to eq score }

    context 'when score < 10' do
      before do
        expect(match).to receive_message_chain('scouts.first.score').and_return(4)
      end
      it { is_expected.to eq '04' }
    end
  end

  describe '#score_second_team' do
    let(:match) { create(:complete_match) }
    let(:score) { '04' }
    subject  { decorator.score_second_team }

    it { is_expected.to eq score }
  end

  describe '#players_for_select' do
    before { create_list(:player, 3) }
    subject  { decorator.players_for_select.size }
    it { is_expected.to be 3 }
  end

  describe '#scout_first_team' do
    let(:match)   { create(:complete_match) }
    subject  { decorator.scout_first_team }
    it { is_expected.to eq match.scouts.first }
  end

  describe '#scout_second_team' do
    let(:match)   { create(:complete_match) }
    subject  { decorator.scout_second_team }
    it { is_expected.to eq match.scouts.last }
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

  describe '#title_for_second_team' do
    let(:match)   { create(:complete_match) }
    let(:players) { match.scouts.last.team.players }
    let(:title)   { "<div>#{players.first.title} - #{players.last.title}</div>" }

    subject { decorator.title_for_second_team }

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
