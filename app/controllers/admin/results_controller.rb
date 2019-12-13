class Admin::ResultsController < Admin::BaseController
  # 検証結果を取得
  before_action :set_result, only: %i[show edit update destroy]

  # 検証結果一覧を表示、検索機能Ransackの処理を追加
  def index
    @q = Result.page(params[:page]).order(id: 'DESC').ransack(params[:q])
    @results = @q.result(distinct: true)
  end

  # 検証結果詳細を表示
  def show; end

  # 検証結果を削除
  def destroy
    @result.destroy!
    redirect_to admin_results_path, success: '検証結果を削除しました'
  end

  private

  # 掲示板情報を取得
  def set_result
    @result = Result.find(params[:id])
  end
end
