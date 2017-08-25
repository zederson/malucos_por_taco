require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '.flash_keys' do
    it { expect(helper.flash_keys(:success)).to eq 'alert-success' }
    it { expect(helper.flash_keys(:error)).to eq 'alert-danger' }
    it { expect(helper.flash_keys(:notice)).to eq 'alert-info' }
    it { expect(helper.flash_keys(:alert)).to eq 'alert-warning' }

    it { expect(helper.flash_keys(:taco)).to be_nil }
  end

  describe '.errors_for' do
    let(:player) { Player.new }
    subject { helper.errors_for player, :name }
    before { player.valid? }

    it { is_expected.to eq 'has-danger' }

    it 'no errors for attribute' do
      expect(helper.errors_for(Player.new, :nick_name)).to be_nil
    end

    it 'invalid object' do
      expect(helper.errors_for(nil, :nick_name)).to be_nil
    end
  end

  describe '.print_errors' do
    let(:player) { Player.new }
    subject { helper.print_errors player, :name }
    before { player.valid? }

    it 'invalid object' do
      expect(helper.print_errors(nil, :nick_name)).to be_nil
    end

    it 'create div' do
      text = 'não pode ficar em branco'
      e = "<div><div class=\"form-control-feedback\">#{text}</div></div>"
      is_expected.to eq e
    end
  end

  describe '.image_profile' do
    subject { helper.image_profile 'Zé' }
    it { is_expected.to eq '<img alt="Zé" src="/images/profile/ze.jpg" />' }
  end
end
