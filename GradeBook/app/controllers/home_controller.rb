class HomeController < ApplicationController
  def index
    if current_user.user_type.slug == 'teacher'
      @dispensed_lectures = current_user.dispensed_lectures
    end
  end
end
