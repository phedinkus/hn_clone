class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.integer :user_id
      t.integer :vote_counter

      t.timestamps
    end
  end
end
