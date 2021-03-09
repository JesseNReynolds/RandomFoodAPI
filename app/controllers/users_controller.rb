class UsersController < ApplicationController

  # POST /users
  def create
    @user = User.find_or_create_by(fb_id: user_params[:fb_id])

    if @user
      render json: {status: 202}
    else
      render json: @user.errors, status: :unprocessable_entity
    end
    
  end


  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:fb_id, :settings_obj)
    end
end
