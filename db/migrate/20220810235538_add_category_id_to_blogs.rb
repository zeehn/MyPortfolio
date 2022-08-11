class AddCategoryIdToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_reference :blogs, :category, foreign_key: true
  end
end
