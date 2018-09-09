require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET #index' do
    it 'render index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
