class AddDescriptionToBlogs < ActiveRecord::Migration[8.0]
  
  def change
    add_column :blogs, :description, :text
  end

end
