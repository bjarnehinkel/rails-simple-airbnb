class FlatsController < ApplicationController
  before_action :find_flat, only: [:show, :destroy, :edit, :update]

  def index
    @flats = Flat.all
  end

  def show; end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flats_path
    else
      render 'new'
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  def edit; end

  def update
    if @flat.valid?
      @flat.update(flat_params)
      redirect_to flats_path
    else
      render 'edit'
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end
end
