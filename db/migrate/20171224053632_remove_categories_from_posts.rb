class RemoveCategoriesFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :categories, :string
  end
end
