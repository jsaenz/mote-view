class AdminController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @users=User.all
    #@admins=Admin.all
  end
end