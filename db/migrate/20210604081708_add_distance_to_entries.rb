class AddDistanceToEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :distance, :string
  end
end
