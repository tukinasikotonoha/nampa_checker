class Admin::UsersController < Admin::BaseController
  # 検証結果一覧を表示、検索機能Ransackの処理を追加
  def index
    @q = User.page(params[:page]).order(id: 'DESC').ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  # 検証結果を削除
  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to admin_users_path, success: 'ユーザーを削除しました'
  end
end
