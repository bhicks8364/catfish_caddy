class AddReturnedToFish < ActiveRecord::Migration
  def change
    add_column :fish, :returned, :boolean, default: false
  end
end
