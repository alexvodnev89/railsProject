class MembershipOptionsController < ApplicationController
  before_action :set_membership_option, only: [:show, :edit, :update, :destroy]
  before_action :correct_user

  # GET /membership_options
  # GET /membership_options.json
  def index
    @membership_options = MembershipOption.all
  end

  # GET /membership_options/1
  # GET /membership_options/1.json
  def show
  end

  # GET /membership_options/new
  def new
    @membership_option = MembershipOption.new
  end

  # GET /membership_options/1/edit
  def edit
  end

  # POST /membership_options
  # POST /membership_options.json
  def create
    @membership_option = MembershipOption.new(membership_option_params)

    respond_to do |format|
      if @membership_option.save
        format.html { redirect_to @membership_option, notice: 'Membership option was successfully created.' }
        format.json { render :show, status: :created, location: @membership_option }
      else
        format.html { render :new }
        format.json { render json: @membership_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /membership_options/1
  # PATCH/PUT /membership_options/1.json
  def update
    respond_to do |format|
      if @membership_option.update(membership_option_params)
        format.html { redirect_to @membership_option, notice: 'Membership option was successfully updated.' }
        format.json { render :show, status: :ok, location: @membership_option }
      else
        format.html { render :edit }
        format.json { render json: @membership_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /membership_options/1
  # DELETE /membership_options/1.json
  def destroy
    @membership_option.destroy
    respond_to do |format|
      format.html { redirect_to membership_options_url, notice: 'Membership option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership_option
      @membership_option = MembershipOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_option_params
      params.require(:membership_option).permit(:title, :description, :price)
    end
    
    def correct_user
      @user = current_user
      redirect_to root_url if !current_user.admin
    end
end
