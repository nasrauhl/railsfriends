class AddLinkToEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :link, :string
  end
end
