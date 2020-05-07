class AddCommentTextToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :commentText, :text
  end
end
