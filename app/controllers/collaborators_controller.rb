class CollaboratorsController < ApplicationController
  

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
      redirect_to edit_wiki_path(@wiki)
    
    else
      flash[:alert] = "An error occured adding the collaborator. Please try again."
      redirect_to edit_wiki_path(@wiki)
    end
    end
end

def destroy
  
  @collaborator = Collaborator.find(params[:id])
  @wiki = @collaborator.wiki
  
  
  if @collaborator.destroy
    flash[:notice] = "The collaborator was removed."
    redirect_to edit_wiki_path(@wiki)
  
  else
    flash[:alert] = "An error occured while removing this collaborator. Please try again."
    redirect_to edit_wiki_path(@wiki)
  end
end
end