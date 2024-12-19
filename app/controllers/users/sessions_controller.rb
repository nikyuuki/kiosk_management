class Users::SessionsController < Devise::SessionsController
  layout "authentication", only: [:new] # Use a custom layout for the sign-in page
end
