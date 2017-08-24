require 'rails_helper'

feature 'Editing player' do
  let(:user)   { create(:user) }
  let(:player) { create(:player) }

  before { login_as(user, scope: :user, run_callbacks: false) }

  scenario 'successfully' do
    player
    visit root_path

    all('#nav_players')[1].click
    click_on 'Editar'

    fill_in 'Nome', with: 'Antonio Carlos'
    fill_in 'Apelido', with: 'Mussum'

    click_on 'Atualizar Jogador'

    expect(page).to have_content 'Antonio Carlos'
    expect(page).to have_content 'Mussum'
    expect(page).to have_content 'Alteração realizada com sucesso !!!'
  end

  scenario 'failed' do
    player
    visit root_path

    all('#nav_players')[1].click
    click_on 'Editar'

    fill_in 'Nome', with: ''
    fill_in 'Apelido', with: ''

    click_on 'Atualizar Jogador'

    expect(page).to have_content('Não foi possível realizar a alteração')
  end
end
