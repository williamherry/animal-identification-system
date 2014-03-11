class AnimalBehaviorsController < ApplicationController
  before_action :set_animal_behavior, only: [:show, :edit, :update, :destroy]

  # GET /animal_behaviors
  # GET /animal_behaviors.json
  def index
    @animal_behaviors = AnimalBehavior.all
  end

  # GET /animal_behaviors/1
  # GET /animal_behaviors/1.json
  def show
  end

  # GET /animal_behaviors/new
  def new
    @animal_behavior = AnimalBehavior.new
  end

  # GET /animal_behaviors/1/edit
  def edit
  end

  # POST /animal_behaviors
  # POST /animal_behaviors.json
  def create
    @animal_behavior = AnimalBehavior.new(animal_behavior_params)

    respond_to do |format|
      if @animal_behavior.save
        format.html { redirect_to @animal_behavior, notice: 'Animal behavior was successfully created.' }
        format.json { render action: 'show', status: :created, location: @animal_behavior }
      else
        format.html { render action: 'new' }
        format.json { render json: @animal_behavior.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animal_behaviors/1
  # PATCH/PUT /animal_behaviors/1.json
  def update
    respond_to do |format|
      if @animal_behavior.update(animal_behavior_params)
        format.html { redirect_to @animal_behavior, notice: 'Animal behavior was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @animal_behavior.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animal_behaviors/1
  # DELETE /animal_behaviors/1.json
  def destroy
    @animal_behavior.destroy
    respond_to do |format|
      format.html { redirect_to animal_behaviors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal_behavior
      @animal_behavior = AnimalBehavior.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def animal_behavior_params
      params.require(:animal_behavior).permit(:code, :behavior)
    end
end
