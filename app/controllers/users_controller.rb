# app/controllers/users_controller.rb
class UsersController <

  before_action :authenticate_user  # Ensure the user is logged in
  def dashboard
    layout "authentication"
    # User dashboard logic
  end
end
