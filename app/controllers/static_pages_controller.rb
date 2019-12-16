class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[privacy term]

  def privacy; end

  def term; end
end
