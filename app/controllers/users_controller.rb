class UsersController < ApplicationController
  def index
    @users = User.no_active_conversation_with(current_user)
  end
end
