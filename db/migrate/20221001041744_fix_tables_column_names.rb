class FixTablesColumnNames < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :author_id
    rename_column :likes, :users_id, :author_id

    remove_column :posts, :author_id
    rename_column :posts, :users_id, :author_id
  end
end
