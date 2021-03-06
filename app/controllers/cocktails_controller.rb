class CocktailsController < ApplicationController

  before_action :set_cocktail, only: [:show, :edit]



  def index
    if params[:search] && params[:search][:query] != ""
      @cocktails = Cocktail.all.select { |cocktail| cocktail.name.downcase == params[:search][:query].downcase }
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    @cocktails = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to new_cocktail_dose_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

end
