class UsersController < ApplicationController

  def create
    @user = User.find(params[:id])
  end

end
