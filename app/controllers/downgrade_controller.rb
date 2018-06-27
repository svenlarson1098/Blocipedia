class DowngradeController < ApplicationController
  def new
  end
  
  def update
    current_user.standard!
   # current_user.wikis.each do |pub|
  #    pub.update_attribute(:private, false)
   # end
 
    flash[:notice] = "Your membership has been downgraded to a standard account."
      redirect_to root_path
  end
end