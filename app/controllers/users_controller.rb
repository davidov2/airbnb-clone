class UsersController < ApplicationController

 def index
  @users = User.all
 end

 def show
   @user = User.find(params[:id])
 end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_param)
  # end




  # private
  # def user_param
  #   params.require(:user).permit(:name, :pilote)
  # end


end
