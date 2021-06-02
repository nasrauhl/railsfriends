class AddCampusToPreference < ActiveRecord::Migration[6.1]
  def change
    add_column :preferences, :campus, :string
  end
end
