class RenameTypeToCategory < ActiveRecord::Migration[6.1]
  def change
  	rename_column :preferences, :type, :category
  end
end
