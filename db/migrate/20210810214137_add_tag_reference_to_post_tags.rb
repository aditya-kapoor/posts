class AddTagReferenceToPostTags < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :post_tags, :tags
    add_index :post_tags, :tag_id
    change_column_null :post_tags, :tag_id, false
  end
end
