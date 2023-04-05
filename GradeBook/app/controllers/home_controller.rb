class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.user_type.slug == 'TEA'
      @dispensed_lectures = current_user.dispensed_lectures
    end
  end
end
