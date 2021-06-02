class PreferencesController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]


def new
    @preference = Preference.new
    @campus = Entry.pluck(:uni_name).uniq
end

def create
   @preference = Preference.create(preference_params)
   redirect_to @preference
end

def show
 	@preference = Preference.find(params[:id])
end

  private

def preference_params
  	params.require(:preference).permit(:category, :location, :min_price, :max_price, :campus)
end

end
