class Users::HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.teacher?
      redirect_to '/lectures'
    elsif current_user.student?
      redirect_to '/grades'
    end
  end

end
