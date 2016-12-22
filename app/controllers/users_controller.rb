class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]

  def new
	 @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
  	@user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed"
    redirect_to users_url
  end

  def edit
    @user = User.find(params[:id])
    logger.fatal "zubin test start"
    logger.fatal "params : #{params}"
    logger.fatal "current user : #{current_user.id} "
    logger.fatal "params : #{params}"
    logger.fatal "session remember_token : #{session[:remember_token]}" 
    logger.fatal "zubin test end"
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])  
      flash[:success] = "#{params[:user][:name]} Profile updated"
      sign_in @user
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

  private

    def signed_in_user
        store_location
        redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
        @user = User.find(params[:id])
        redirect_to root_url unless current_user?(@user)
    end

    # def admin?
    #  self.admin
    #end

end