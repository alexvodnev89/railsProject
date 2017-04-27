class PagesController < ApplicationController
  
  def show
    # @page = Page.find(params[:id])
    @page = Page.find_by(title: params[:title])
  end
  
  def index
    @pages = Page.all
  end
  
  def new
    @page = Page.new
  end
  
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to pages_url, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :content)
    end
    
     def correct_user
      redirect_to root_url if !admin_user? && !logged_in?
    end
  
end