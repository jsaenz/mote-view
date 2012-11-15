# Controller for the admin view
# @author Jon Saenz
class AdminController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @users=User.all
  end
end