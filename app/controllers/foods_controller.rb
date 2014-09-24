class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  # GET /foods
  # GET /foods.json
  def index
    @pet = Pet.find(params[:pet_id])
    @foods = Food.all
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @food = Food.new
  end

  # POST /foods
  # POST /foods.json
  def create
    @pet = Pet.find(params[:pet_id])
    @food = @pet.foods.build(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to @pet, notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @pet = Pet.find(params[:pet_id])
    @food = @pet.foods.find(params[:id])

    @food.destroy
    respond_to do |format|
      format.html { redirect_to @pet, notice: 'Food was successfully pooped by your pet.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:name, :calories)
    end
end
