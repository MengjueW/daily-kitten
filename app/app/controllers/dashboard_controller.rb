class DashboardController < ApplicationController
  layout 'dashboard'
  before_filter :authenticate_shelter!

  def show
    @shelter = current_shelter
  end
end
