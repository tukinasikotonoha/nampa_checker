class ChangeColumnToResult < ActiveRecord::Migration[5.2]
  def up
    change_column :results, :id, :string
  end

  # 変更前の状態
  def down
    change_column :results, :id, :integer
  end
end
