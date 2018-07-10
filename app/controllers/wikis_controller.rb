class WikisController < ApplicationController

  before_action :authenticate_user!

  def index
    @wikis = policy_scope(Wiki)
  end
  
  def create
     @wiki = Wiki.new(params[:id])
     @wiki.assign_attributes(wiki_params)
     authorize @wiki
    
    if @wiki.save
      flash[:notice] = "Wiki created & saved!"
      redirect_to @wiki
    else
      flash.now[:alert] = "An error occurred creating the wiki. Please try again."
      render :new
    end
  end
  
  def new
    @wiki = Wiki.new
  end
      
  def edit
    @wiki = Wiki.find(params[:id])
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)

     
    if @wiki.save
       flash[:notice] = "Wiki updated!"
       redirect_to @wiki
  
    else
      flash.now[:alert] = "An error occurred saving the wiki. Please try again."
      render :edit
    end
  end
    
  def show
    @wiki = Wiki.find(params[:id])
  end
    
  def destroy
    @wiki = Wiki.find(params[:id])
    
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to action: :index
      
    else
      flash.now[:alert] = "An error occurred deleting the wiki. Please try again."
      render :show
    end
  end
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
