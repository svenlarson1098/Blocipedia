class WikisController < ApplicationController

  before_action :authenticate_user!

  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end
  
  def new
    @wiki = Wiki.new
  end
  
  def create
    #@wiki = Wiki.new
    #@wiki.title = params[:wiki][:title]
    #@wiki.body = params[:wiki][:body]
    @wiki = current_user.wikis.new(wiki_params)
    
    if @wiki.save
      flash[:notice] = "Wiki saved!"
      redirect_to @wiki
    else
      flash.now[:alert] = "An error occurred saving the wiki. Please try again."
      render :new
    end
  end
      
  def edit
    @wiki = Wiki.find(params[:id])
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    #@wiki.title = params[:wiki][:title]
    #@wiki.body = params[:wiki][:body]
    #authorize @wiki
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
     
    #if @wiki.save
    if @wiki.update(wiki_params)
      flash[:notice] = "Wiki updated!"
      redirect_to @wiki
  
    else
      flash.now[:alert] = "An error occurred saving the wiki. Please try again."
      render :edit
    end
  end
    
  def destroy
    @wiki = Wiki.find(params[:id])
    
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
      
    else
      flash.now[:alert] = "An error occurred deleting the wiki. Please try again."
      render :show
    end
  end
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end
end
