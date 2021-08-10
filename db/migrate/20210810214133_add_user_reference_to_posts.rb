class AddUserReferenceToPosts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :posts, :users
    add_index :posts, :user_id
  end
end
