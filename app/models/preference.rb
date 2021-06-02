class Preference < ApplicationRecord

	def preference_entries

		entries = Entry.all

		entries = entries.where(["room_type LIKE ?","%#{category}%"]) if category.present?
		entries = entries.where(["location LIKE ?","%#{location}%"]) if location.present?
		entries = entries.where(["rent >= ?", min_price]) if min_price.present?	
		entries = entries.where(["rent <= ?", max_price]) if max_price.present?
		entries = entries.where(["uni_name LIKE ?",campus]) if campus.present?

		return entries
	end	
end
