require 'rails_helper'

feature 'search match dates' do
  let(:user)    { create(:user) }

  before do
    login_as(user, scope: :user, run_callbacks: false)
    start  = Time.zone.local(2017, 8, 5, 9, 0)
    finish = start + 10.minutes
    create(:complete_match, started_at: start, finished_at: finish)

    start += 1.day
    finish = start + 10.minutes
    create(:complete_match, started_at: start, finished_at: finish)
  end

  scenario 'search matches' do
    visit matches_path
    select('05/08/2017', from: 'q[started_at]')
    find('#search_button').click
    expect(page).to have_content 'Um jogo'
  end

  scenario 'no search' do
    visit matches_path
    expect(page).to have_content '2 jogos'
  end
end

feature 'matches not found' do
  let(:user) { create(:user) }

  before { login_as(user, scope: :user, run_callbacks: false) }

  scenario 'no match' do
    visit matches_path
    expect(page).to have_content 'Não tem jogos'
  end
end
