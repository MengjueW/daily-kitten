class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Pictures.all
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
    @cat = Cat.find(params[:cat_id])
    @picture = @cat.pictures.build
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(picture_params)

    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    @cat = Cat.find(@picture.cat_id)

    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to cat_path(@cat), notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @cat_id = @picture.cat_id
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to cat_path(@cat_id), notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def make_default
    @picture = Picture.find(params[:id])
    @cat = Cat.find(params[:cat_id])

    @cat.cover = @cat.id
    @cat.save

    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:description, :cat_id, :image)
    end
end
