class AddPhotoToEntry < ActiveRecord::Migration[6.1]
  def change
  	add_column :entries, :photo, :string
  end
end
