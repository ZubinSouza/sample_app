class UsersController < ApplicationController
  def new
	@user = User.new
  end
  def index
  end
  def show
  	@user = User.find(params[:id])
  end
  def destroy
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])  
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def create
	   @user = User.new(params[:user])
	   if @user.save
        flash[:success] = "Welcome to sample app"
        #render :action => :show
        redirect_to @user
	   else
		    render 'new'
	   end
  end

end