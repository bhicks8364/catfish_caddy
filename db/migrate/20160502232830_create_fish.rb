class CreateFish < ActiveRecord::Migration
  def change
    create_table :fish do |t|
      t.integer :color_id
      t.decimal :weight
      t.boolean :over_28
      t.integer :tournament_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :fish, :color_id
    add_index :fish, :tournament_id
    add_index :fish, :user_id
  end
end
