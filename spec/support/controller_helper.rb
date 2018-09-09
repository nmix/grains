module ControllerHelpers
  def attributes_with_foreign_keys_for(*args)
    build(*args).attributes.delete_if do |k, v|
      ["id", "created_at", "updated_at"].member?(k)
    end
  end
end


RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include ControllerHelpers, type: :controller
end
