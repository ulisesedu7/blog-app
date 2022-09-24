class FixColumnRelation < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :author_id
    rename_column :likes, :user_id, :author_id

    remove_column :comments, :author_id
    rename_column :comments, :user_id, :author_id
  end
end
