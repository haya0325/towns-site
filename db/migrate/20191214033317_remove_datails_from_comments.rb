class RemoveDatailsFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :rent_price, :string
    remove_column :comments, :floor_plan, :string
  end
end
