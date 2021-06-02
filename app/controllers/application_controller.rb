class ApplicationController < ActionController::Base
	def favorite_text
		return @favorite_exists ? "Unfav" : "Fav"
	end
helper_method :favorite_text
end
