require 'rails_helper'



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
