class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist 
  include UsersSource
  include GuestUserConcern
  include SetPageDefaults
end

