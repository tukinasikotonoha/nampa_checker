class UsersController < ApplicationController
  def show
    @results = current_user.results.page(params[:page]).order(id: :desc)
  end
end
