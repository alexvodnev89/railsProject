class GymclassesController < ApplicationController
  before_action :set_gymclass, only: [:show, :edit, :update, :destroy]
  before_action :correct_user

  # GET /gymclasses
  # GET /gymclasses.json
  def index
    @gymclasses = Gymclass.all
  end

  # GET /gymclasses/1
  # GET /gymclasses/1.json
  def show
  end

  # GET /gymclasses/new
  def new
    @gymclass = Gymclass.new
  end

  # GET /gymclasses/1/edit
  def edit
  end

  # POST /gymclasses
  # POST /gymclasses.json
  def create
    @gymclass = Gymclass.new(gymclass_params)

    respond_to do |format|
      if @gymclass.save
        format.html { redirect_to @gymclass, notice: 'Gymclass was successfully created.' }
        format.json { render :show, status: :created, location: @gymclass }
      else
        format.html { render :new }
        format.json { render json: @gymclass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gymclasses/1
  # PATCH/PUT /gymclasses/1.json
  def update
    respond_to do |format|
      if @gymclass.update(gymclass_params)
        format.html { redirect_to @gymclass, notice: 'Gymclass was successfully updated.' }
        format.json { render :show, status: :ok, location: @gymclass }
      else
        format.html { render :edit }
        format.json { render json: @gymclass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gymclasses/1
  # DELETE /gymclasses/1.json
  def destroy
    @gymclass.destroy
    respond_to do |format|
      format.html { redirect_to gymclasses_url, notice: 'Gymclass was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gymclass
      @gymclass = Gymclass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gymclass_params
      params.require(:gymclass).permit(:name, :weekday, :description)
    end
    
    def correct_user
      redirect_to root_url if !admin_user? && !logged_in?
    end
end
