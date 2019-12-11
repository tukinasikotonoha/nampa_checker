class ChangeColumnToResult < ActiveRecord::Migration[5.2]
  # 変更内容
  def up
    change_column :results, :message_id, :bigint, null: false, default: 1
  end

  # 変更前の状態
  def down
    change_column :results, :message_id, :bigint, null: false
  end
end
