require 'rails_helper'

feature 'Create an new player' do
  let(:user)   { create(:user) }
  let(:player) { build(:player) }

  before { login_as(user, :scope => :user, :run_callbacks => false) }

  scenario 'successfully' do
    visit root_path

    click_on 'Jogadores'
    click_on 'Novo'

    fill_in 'Nome', with: player.name
    fill_in 'Apelido', with: player.nick_name
    click_on 'Criar Jogador'

    expect(page).to have_content(player.name)
    expect(page).to have_content(player.nick_name)
    expect(page).to have_content('Cadastrado com sucesso')
  end

  scenario 'failed' do
    visit new_player_path

    click_on 'Criar Jogador'

    expect(page).to have_content('não pode ficar em branco')
  end
end
