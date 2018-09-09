module Requests
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end

    def token_for(user)
      JsonWebToken.encode(user_id: user.id)
    end
  end
end

RSpec.configure do |config|
  config.include Requests::JsonHelpers, type: :request
  config.include Devise::Test::IntegrationHelpers, type: :request
end
