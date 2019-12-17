class AddImageToStations < ActiveRecord::Migration[5.2]
  def change
    add_column :stations, :image, :string
  end
end
