class DowngradeController < ApplicationController
  def update
    current_user.standard!
 
    flash[:notice] = "Your membership has been downgraded to a standard account."
      redirect_to root_path
  end
end