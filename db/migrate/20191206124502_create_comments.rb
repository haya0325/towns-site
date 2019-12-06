class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :rate
      t.text :content
      t.string :rent_price
      t.string :floor_plan

      t.timestamps
    end
  end
end
