class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.datetime :published_at
      t.integer :user_id
      t.string :title
      t.text :html
      t.integer :status

      t.timestamps
    end
  end
end
