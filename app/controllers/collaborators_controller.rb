class CollaboratorsController < ApplicationController
  
<<<<<<< HEAD
def new
  @collaborator = Collaborator.new  
end

  def create
    @collaborator_user = User.find_by email(params[:collaborator])
    @wiki = Wiki.find(params[:wiki_id])
    
    if wiki.collaborators.exists?(user_id: @collaborator_user.id)
      flash[:notice] = "#{@collaborator_user.email} is already a collaborator."
      redirect_to edit_wiki_path(@wiki)
      
    else
      @collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: @collaborator_user.id)
      
    if @collaborator.save
      flash[:notice] = "#{@collaborator_user.email} was added as a collaborator."
=======

def create
    @user = User.where(email: params[:collaborator]).take
    @wiki = Wiki.find(params[:wiki_id])
    
    if @user == nil
      flash[:notice] = "User email could not be found."
      redirect_to edit_wiki_path(@wiki)
    
    elsif @wiki.users.include?(@user)
      flash[:notice] = "User is already a collaborator."
      redirect_to edit_wiki_path(@wiki)

    else
      @collaborator = Collaborator.new
      @collaborator.user_id = @user.id
      @collaborator.wiki_id = @wiki.id
    
    if @collaborator.save
      flash[:notice] = "New collaborator added."
>>>>>>> wiki-collaborators
      redirect_to edit_wiki_path(@wiki)
    
    else
      flash[:alert] = "An error occured adding the collaborator. Please try again."
      redirect_to edit_wiki_path(@wiki)
    end
    end
<<<<<<< HEAD
  end

def destroy
  @wiki = Wiki.find(params[:wiki_id])
  @collaborator = Collaborator.find(params[:id])
  @collaborator_user = User.find(@collaborator.user_id)
  
  if @collaborator.destroy
    flash[:notice] = "#{@collaborator_user.email} was removed as a collaborator."
=======
end

def destroy
  
  @collaborator = Collaborator.find(params[:id])
  @wiki = @collaborator.wiki
  
  
  if @collaborator.destroy
    flash[:notice] = "The collaborator was removed."
>>>>>>> wiki-collaborators
    redirect_to edit_wiki_path(@wiki)
  
  else
    flash[:alert] = "An error occured while removing this collaborator. Please try again."
    redirect_to edit_wiki_path(@wiki)
  end
end
end