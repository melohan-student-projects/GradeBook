class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.user_type.slug == 'TEA'
      render partial: 'lectures'
    elsif current_user.user_type.slug == 'STU'
      render partial: 'grades'
    end
  end

end
