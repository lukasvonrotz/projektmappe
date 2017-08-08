class UsersController < ApplicationController
  def index
    @users = User.all
  end

  # Delete a user
  # DELETE /users/:id
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, :notice => 'Benutzer wurde gelöscht.'
  end
end
