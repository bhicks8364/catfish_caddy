class AddImageToFish < ActiveRecord::Migration
  def change
    add_column :fish, :image_id, :string
    remove_column :fish, :user_id, :integer
    add_column :fish, :member_id, :integer
    add_index :fish, :member_id
  end
end
