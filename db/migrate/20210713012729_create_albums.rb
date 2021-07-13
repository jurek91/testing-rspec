class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.date :date_released
      t.integer :issue_number

      t.timestamps
    end
  end
end
