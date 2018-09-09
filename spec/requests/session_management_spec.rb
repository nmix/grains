require 'rails_helper'

RSpec.describe 'Session management', :type => :request do
  let(:user) { create(:user) }

  it 'signing in and redirects to dashboard' do
    get '/users/sign_in'
    expect(response).to render_template(:new)
    
    post '/users/sign_in', params: {
      user: {email: user.email, password: '12345678'}
    }
    expect(response).to redirect_to('/dashboard/index')
  end
end
