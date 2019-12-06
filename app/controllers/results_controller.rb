class ResultsController < ApplicationController

  def show
    @result = Result.find_by(uuid: params[:uuid])
  end

  def new
    @result = Result.new
  end

  def create
    @result = current_user.results.new(result_params)
    @result.message_id = Message.where(maximum: @result.score..Float::INFINITY).order("maximum desc").last.id
    if @result.save
      redirect_to result_path(@result.uuid)
    else
      redirect_to root_path, danger: "検証に失敗しました"
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
