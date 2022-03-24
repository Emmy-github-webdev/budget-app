require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  current_user = User.first_or_create!(
    name: 'John Doe',
    email: 'john.doe@example.com',
    password: 'password',
    password_confirmation: 'password'
  )

  let(:valid_attributes) do
    {
      'id' => '1',
      'name' => 'Apple',
      'icon' => 'http://www.image.com',
      'user' => current_user
    }
  end

  let(:invalid_attributes) do
    {
      'id' => 'a',
      'name' => nil,
      'icon' => 'http://www.image.com'
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      categories = Category.new(valid_attributes)
      categories.user = current_user
      categories.save
      get categories_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      category = Category.new(valid_attributes)
      category.user = current_user
      category.save
      get category_url(category)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_category_url
      expect(response).to be_successful
    end
  end

  describe 'DELETE /destroy' do
    it 'redirects to the categories list' do
      category = Category.new(valid_attributes)
      category.user = current_user
      category.save
      delete category_url(category)
      expect(response).to redirect_to(categoriess_url)
    end
  end
end
