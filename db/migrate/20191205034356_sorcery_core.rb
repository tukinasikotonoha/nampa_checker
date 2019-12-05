class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :crypted_password
      t.string :salt
      t.string :name, null: false
      t.integer :role, null: false, default: 0
      t.timestamps null: false
    end
  end
end
