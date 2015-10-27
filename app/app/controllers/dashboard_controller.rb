class DashboardController < ApplicationController
  layout 'dashboard'

  def show
    @shelter = current_shelter
  end
end
