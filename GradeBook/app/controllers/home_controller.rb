class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.teacher?
      render partial: 'lectures'
    elsif current_user.student?
      render partial: 'grades'
    end
  end

end
