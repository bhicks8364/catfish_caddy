class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :body
      t.string :sentiment
      t.decimal :score

      t.timestamps null: false
    end
  end
end
