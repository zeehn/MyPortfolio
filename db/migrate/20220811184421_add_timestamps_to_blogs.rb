class AddTimestampsToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :created_at, :timestamp
    add_column :blogs, :updated_at, :timestamp
  end
end
