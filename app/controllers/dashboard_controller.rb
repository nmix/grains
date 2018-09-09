# Dashboard for logged user
class DashboardController < ApplicationController
  def index
    result = CurrentTime.call
    @current_time = result.success? ? result.current_time : 'Out of time'
  end
end
