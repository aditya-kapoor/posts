class AddPostReferenceToPostTags < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :post_tags, :posts
    add_index :post_tags, :post_id
    change_column_null :post_tags, :post_id, false
  end
end
