class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist 
  include UsersSource
  include GuestUser
  include SetPageDefaults
end

