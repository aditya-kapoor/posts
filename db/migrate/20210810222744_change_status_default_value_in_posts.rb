class ChangeStatusDefaultValueInPosts < ActiveRecord::Migration[6.0]
  def change
    change_column_default :posts, :status, "draft"
  end
end
