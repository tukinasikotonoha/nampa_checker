class Admin::MessagesController < Admin::BaseController
  # メッセージ情報を取得
  before_action :set_message, only: %i[edit update]

  # 掲示板一覧を表示、検索機能Ransackの処理を追加
  def index
    @messages = Message.all.order(id: :desc)
  end

  # メッセージ編集画面に移動
  def edit; end

  # メッセージを更新
  def update
    if @message.update(message_params)
      redirect_to admin_messages_path, success: 'メッセージを更新しました'
    else
      flash.now[:danger] = 'メッセージを更新できませんでした'
      render :edit
    end
  end

  private

  # 掲示板情報を取得
  def set_message
    @message = Message.find(params[:id])
  end

  # Strong Parameter
  def message_params
    params.require(:message).permit(:advice)
  end
end
