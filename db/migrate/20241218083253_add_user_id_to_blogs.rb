class AddUserIdToBlogs < ActiveRecord::Migration[8.0]
  def change
    add_column :blogs, :user_id, :int
  end
end
