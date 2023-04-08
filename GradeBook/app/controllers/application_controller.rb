class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  include Devise::Controllers::SignInOut
end
