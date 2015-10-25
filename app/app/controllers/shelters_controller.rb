class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def new
      @shelter = Shelter.new
  end
  def show
  end
def create
    @shelter = Shelter.new(params.require(:shelter).permit(:title, :city, :url))

    respond_to do |format|
      if @shelter.save
	format.html { redirect_to @shelter, notice: 'Shelter was successfully created.' }
	format.json { render :show, status: :created, location: @shelter }
      else
	format.html { render :new }
	format.json { render json: @shelter.errors, status: :unprocessable_entity }
      end
    end
  end
end
