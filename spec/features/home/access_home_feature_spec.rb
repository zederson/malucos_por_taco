require 'rails_helper'

feature 'Access Home Page' do
  let(:user) { create(:user) }

  scenario 'successfully' do
    login_as(user, scope: :user, run_callbacks: false)
    visit root_path
    expect(page).to have_content('Dados de Jogos')
  end
end
