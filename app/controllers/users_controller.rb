class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[show]

  def show
    @results = current_user.results
  end
end
