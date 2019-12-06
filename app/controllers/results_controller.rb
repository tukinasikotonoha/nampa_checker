class ResultsController < ApplicationController

  def show; end

  def new
    @result = Result.new
  end

  def create
    @result = current_user.results.new(result_params)
    @result.message_id = Message.where(maximum: @result.score..Float::INFINITY).order("maximum desc").last.id
    if @result.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  # Strong Parameter
  def result_params
    params.require(:result).permit(
        :score,
        :gender,
        :image
    )
  end
end
