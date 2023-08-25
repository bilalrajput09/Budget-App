require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /' do
    it 'Should back with correct response' do
      get root_path
      expect(response).to have_http_status(200)
    end

    it 'Should render welcome page' do
      get root_path
      expect(response).to render_template('users/welcome')
      expect(response.body).to include('LOG IN')
    end
  end
end
