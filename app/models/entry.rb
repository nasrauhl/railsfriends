class Entry < ApplicationRecord
	acts_as_votable
	has_one_attached :photo	

	def self.search(search)
		if search
			where (["building LIKE ?", "%#{search}%"])
		else
			all
		end
	end
end


