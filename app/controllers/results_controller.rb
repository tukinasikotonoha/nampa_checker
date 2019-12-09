class ResultsController < ApplicationController
  before_action :set_result, only: %i[show destroy]

  def show; end

  def create
    @result = current_user.results.build(result_params)
    @result.reverse_score if @result.male?
    @result.add_message
    if @result.save
      redirect_to result_path(@result.uuid)
    else
      @result.image.attachment.purge
      flash.now[:danger] = '検証に失敗しました'
      render 'tops/index'
    end
  end

  def destroy
    @result.destroy!
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
