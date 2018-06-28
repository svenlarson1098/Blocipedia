class DowngradeController < ApplicationController
  def new
  end
  
  def update
    current_user.standard!
    current_user.wikis.each do |pub|
    pub.update_attribute(:private, false)
  end
 
    flash[:success] = "Your membership has been downgraded to a standard account. All private wikis are now public."
      redirect_to root_path
  end
end