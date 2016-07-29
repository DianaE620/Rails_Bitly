class UsersController < ApplicationController

  def login
    @user = User.new
  end

  def authenticate

    email = params['user']['email']
    password = params['user']['password']

    if User.authenticate(email, password)
      @user = User.authenticate(email, password)
      session[:id] = @user.id
      redirect_to(@user)
    else
      @user = User.new
      #flash[:error] = "El email o password es incorrecto"
      @error = "El email o password es incorrecto"
      render :login
    end

  end

  def show
    @user = User.find(params['id']);
    @urls_user = @user.urls
  end

  def new
    @user = User.new  
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:id] = @user.id
      redirect_to(@user)
    else
      @errors = @user.errors.messages
      @user = User.new
      render :new
    end

  end

  def edit
    @user = User.find(params[:id])  
  end

  def update
    @user = User.find(params[:id])  
    @user.update(user_params)
    redirect_to(@user)
  end

  def logout
    reset_session
    redirect_to :root
    #render :nothing => true
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
