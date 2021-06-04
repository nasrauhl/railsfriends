class EntriesController < ApplicationController
  before_action :set_entry, only: %i[ show edit update destroy upvote downvote ]
  before_action :authenticate_user!, except: [:index]  

  # GET /entries or /entries.json
  def index
    @entries = Entry.search(params[:search])
    end 

    # GET /entries/1 or /entries/1.json
  def show
    @favorite_exists = Favorite.where(entry: @entry, user: current_user) == [] ? false : true
  end

  def search  
  if params[:search].blank?  
    redirect_to(root_path, alert: "Empty field!") and return  
  else  
    @parameter = params[:search].downcase  
    @results = Entry.all.where("lower(location) LIKE ?", "%#{@parameter}%")  
  end  
  end

  def list
    @entries = Entry.search(params[:search])
    @images = Entry.search(params[:photo])
  end

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries or /entries.json
  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: "Entry was successfully created." }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1 or /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: "Entry was successfully updated." }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1 or /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: "Entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def upvote
    @entry.upvote_by current_user
    redirect_back fallback_location: root_path
  end

  def downvote
    @entry.downvote_by current_user
    redirect_back fallback_location: root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entry_params
      params.require(:entry).permit(:uni_name, :location, :room_type, :rent, :photo, :link, :building, :distance)
    end
end
