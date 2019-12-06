class ResultsController < ApplicationController
  before_action :set_result, only: %i[show destroy]

  def show; end

  def create
    @result = current_user.results.new(result_params)
    @result.gender_is_male_change_score
    @result.message_id = Message.where(maximum: @result.score..Float::INFINITY).order("maximum desc").last.id
    if @result.save
      redirect_to result_path(@result.uuid)
    else
      redirect_to root_path, danger: "検証に失敗しました"
    end
  end

  def destroy
    @result.destroy
    redirect_to mypage_path
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

  def set_result
    @result = Result.find_by(uuid: params[:uuid])
  end
end
