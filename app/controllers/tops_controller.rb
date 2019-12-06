class TopsController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @result = Result.new
  end
end
