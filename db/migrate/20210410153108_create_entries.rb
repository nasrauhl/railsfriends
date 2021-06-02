class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :uni_name
      t.string :location
      t.string :room_type
      t.integer :rent

      t.timestamps
    end
  end
end
