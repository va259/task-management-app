class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update ]
  before_action :authenticate_user!
  before_action :set_current_user, except: %i[ show ]

  # GET /users/1
  def show
    @user
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if params[:id].nil?
        @user = current_user
      else
        @user = User.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end

    def set_current_user
      @user = current_user
    end
end
