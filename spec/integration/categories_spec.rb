require 'rails_helper'

RSpec.describe 'Authentication', type: :feature do
  let(:user) { User.new(name: 'Bilal Ahmed', email: 'bilal@gmail.com', password: 'password') }

  it 'allows a user to sign up' do
    visit new_user_registration_path
    fill_in 'Full name', with: 'Bilal'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Next'
    expect(page).to have_content 'Welcome'
  end
end

RSpec.describe 'Authentication', type: :request do
  let(:user) { User.new(name: 'Bilal Ahmed', email: 'bilal@gmail.com', password: 'password') }

  before do
    sign_in user
  end

  it 'Should show categories for sign in users' do
    get categories_path
    expect(response).to have_http_status(:success)
  end

  it 'Should show new categories page' do
    get new_category_path
    expect(response).to have_http_status(:success)
  end
end

RSpec.describe 'User', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  scenario 'It should create category' do
    visit root_path
    click_button 'Create New Category'
    fill_in 'Name', with: 'Burger king'
    attach_file('category[icon]', Rails.root.join('spec/fixtures/files/mcdonalds.png'), make_visible: true)
    click_button 'Add category'
    expect(page).to have_current_path("#{Capybara.app_host}/categories")
    expect(page).to have_content('Burger king')
  end
end
