class ChangeColumnToComment < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :rate, :integer, null: false
    change_column :comments, :content, :text, null: false
  end
end
