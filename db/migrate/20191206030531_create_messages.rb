class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :advice
      t.decimal :maximum, precision: 5, scale: 2
      t.decimal :minimum, precision: 5, scale: 2
      t.timestamps
    end
  end
end
