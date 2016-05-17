class AddStatusToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :status, :string
  end
end
