require 'rails_helper'

RSpec.describe '/activities', type: :request do
  login_user

  describe 'GET /index' do
    it 'renders a successful response' do
      get categories_path
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_activity_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Activity' do
        expect do
          post activities_url,
               params: { activity: FactoryBot.attributes_for(:activity,
                                                             category_ids: [FactoryBot.create(:category).id]) }
        end.to change(Activity, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new activity' do
        expect do
          post activities_url, params: { activity: FactoryBot.attributes_for(:activity, name: nil) }
        end.to change(Activity, :count).by(0)
      end

      it "renders new page (i.e. to display the 'new' template)" do
        post activities_url, params: { activity: FactoryBot.attributes_for(:activity, name: nil) }
        expect(response).not_to be_successful
      end
    end
  end
end
