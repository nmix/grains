# Parent for devise controllers
# @see /config/initializers/devise.rb
class BaseDeviseController < ActionController::Base
  layout 'devise'
end
