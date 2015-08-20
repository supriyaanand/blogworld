class UsersController < ApplicationController

  before_action :authenticate_user!

    def new
      @user = User.new
    end

    def edit
      @user = User.find(params[:id])
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to 'root'
      else
        render 'new'
      end
    end

    def show
      @user = User.find(params[:id])
    end

    def index
      @users = User.all
    end

    def update
      @user = User.find(params[:id])

      if @user.update(user_params)
        redirect_to @user
      else
        render 'edit'
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy

      redirect_to users_path
    end

    private

    def user_params
      params.require(:user).permit(:name, :email)
    end

end
