class ResultsController < ApplicationController
  before_action :set_result, only: %i[show destroy]
  skip_before_action :require_login, only: %i[show]

  def show; end

  def create
    @result = current_user.results.build(result_params)
    # 10MBを超える画像や、画像以外のファイルを顔認証APIで検証したくないので、最初にバリデーションを走らせる
    if @result.valid?
      @result.fetch_gender_rate
      if @result.gender.blank?
        @result.image.attachment.purge
        redirect_to root_path, danger: '画像の性別を判定できませんでした'
        return
      end
      @result.reverse_score if @result.male?
      @result.add_message
      @result.save
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
    params.require(:result).permit(:image)
  end

  def set_result
    @result = Result.find_by(uuid: params[:uuid])
  end
end
