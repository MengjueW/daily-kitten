class CatsController < ApplicationController
  before_action :set_cat, only: [:show, :edit, :update, :destroy]
  #before_filter :authenticate_user!, except: [:index, :show]
  before_filter :authenticate_shelter!, except: [:index, :show]
  layout 'cat_pins', only: [:index]

  # GET /cats
  # GET /cats.json
  def index
    @cats = Cat.all
  end

  def search
    if params[:search].present?
      @cats = Cat.search(params[:search])
    else
      @cats = Cat.all
    end
  end

  def present
    @cats = current_shelter.cats.all
  end

  # GET /cats/1
  # GET /cats/1.json
  def show
    @pictures = @cat.pictures
  end

  # GET /cats/new
  def new
    @cat = Cat.new
  end

  # GET /cats/1/edit
  def edit
    current_shelter.cats.find(params[:id])
  end

  # POST /cats
  # POST /cats.json
  def create
    @cat = current_shelter.cats.new(cat_params)
    @cat.shelter = current_shelter

    respond_to do |format|
      if @cat.save
        if params[:images]
          params[:images].each { |image|
            @cat.pictures.create(image: image)
          }
        end
        format.html { redirect_to @cat, notice: 'Cat was successfully created.' }
        format.json { render :show, status: :created, location: @cat }
      else
        format.html { render :new }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cats/1
  # PATCH/PUT /cats/1.json
  def update
    respond_to do |format|
      if @cat.update(cat_params)
        if params[:images]
          params[:images].each { |image|
            @cat.pictures.create(image: image)
          }
        end
        format.html { redirect_to @cat, notice: 'Cat was successfully updated.' }
        format.json { render :show, status: :ok, location: @cat }
      else
        format.html { render :edit }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cats/1
  # DELETE /cats/1.json
  def destroy
    @cat = current_shelter.cats.find(params[:id])
    @cat.destroy
    respond_to do |format|
      format.html { redirect_to cats_url, notice: 'Cat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @cat = Cat.find(params[:id])
    @cat.upvote_by current_user
      redirect_to :back
  end

  def downvote
    @cat = Cat.find(params[:id])
    @cat.downvote_by current_user
      redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat
      @cat = Cat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cat_params
      params.require(:cat).permit(:name, :age, :breed, :sex, :description, :pictures)
    end
end
