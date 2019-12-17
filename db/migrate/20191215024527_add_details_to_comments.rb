class AddDetailsToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :station_id, :integer
    add_column :comments, :category_id, :integer
    add_column :comments, :user_id, :integer
  end
end
