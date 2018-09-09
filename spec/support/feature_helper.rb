RSpec.configure do |config|
  # https://github.com/plataformatec/devise/wiki/How-To:-Test-with-Capybara
  config.include Warden::Test::Helpers

  config.after :each do
    Warden.test_reset!
  end
end
