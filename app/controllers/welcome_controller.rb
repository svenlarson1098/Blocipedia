class WelcomeController < ApplicationController
  def index
  end

  def about
  end
  
  @wikis = Wiki.all
end
