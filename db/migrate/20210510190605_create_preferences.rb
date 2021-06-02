class CreatePreferences < ActiveRecord::Migration[6.1]
  def change
    create_table :preferences do |t|
      t.string :type
      t.string :location
      t.decimal :min_price
      t.decimal :max_price

      t.timestamps
    end
  end
end
