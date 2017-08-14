require 'rails_helper'

feature 'Create new Match' do
  let(:user)    { create(:user) }
  let(:players) { create_list(:player, 4) }

  before { login_as(user, scope: :user, run_callbacks: false) }

  scenario 'successfully' do
    players
    visit root_path

    click_on 'Jogos'
    click_on 'Novo'

    find('#match_started_at_4i').find('option[12]').select_option
    find('#match_started_at_5i').find('option[11]').select_option

    find('#match_finished_at_4i').find('option[13]').select_option
    find('#match_finished_at_5i').find('option[11]').select_option

    find('#player_a_1_id').find('option[2]').select_option
    find('#player_a_2_id').find('option[3]').select_option
    find('#scout_a_run').set 12
    find('#scout_a_back').set 2
    find('#scout_a_lost_ball').set 1
    find('#scout_a_bat_delivery').set 2
    find('#scout_a_house').set 3
    find('#scout_a_burned').set 1
    find('#scout_a_victory').set 0
    find('#scout_a_concierge').set 0

    find('#player_b_1_id').find('option[4]').select_option
    find('#player_b_2_id').find('option[5]').select_option
    find('#scout_b_run').set 4
    find('#scout_b_back').set 2
    find('#scout_b_lost_ball').set 1
    find('#scout_b_bat_delivery').set 1
    find('#scout_b_house').set 1
    find('#scout_b_burned').set 2
    find('#scout_b_victory').set 0
    find('#scout_b_concierge').set 1

    click_on 'Criar Jogo'

    expect(page).to have_content 'A partida durou aproximadamente 1 hora'
    expect(page).to have_content 'Começou 11:10h e terminou 12:10h'
    expect(page).to have_content '24 x 08'
  end
end
