require 'rails_helper'

RSpec.describe '/splash', type: :request do
  describe 'GET /index' do
    before(:each) do
      get root_path
    end

    it 'should have the correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'displays the correct template' do
      expect(response).to render_template(:home)
    end

    it 'should show the action buttons' do
      expect(response.body).to include('LOG IN')
      expect(response.body).to include('SIGN UP')
    end
  end
end
