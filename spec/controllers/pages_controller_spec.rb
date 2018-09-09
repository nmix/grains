require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #show' do
    it 'render index template' do
      get :show, params: {page: 'home'}
      expect(response).to render_template(:home)
    end

    it "returns a success response for 'home' page" do
      get :show, params: {page: 'home'}
      expect(response).to have_http_status(:ok)
    end

    it 'returns not_found for not exist page' do
      get :show, params: {page: 'some_page'}
      expect(response).to have_http_status(:not_found)
    end
  end
end
