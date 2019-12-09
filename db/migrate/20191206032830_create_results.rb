class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.decimal :score, precision: 5, scale: 2
      t.integer :gender, null: false
      t.string :uuid
      t.references :user,null: false, foreign_key: true
      t.references :message,null: false, foreign_key: true
      t.timestamps
    end
  end
end
