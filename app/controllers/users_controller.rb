class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorise, except: [:new]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        TwilioService.send_sms(@user.phone_number, "Welcome, #{@user.nickname}! Please use this link to sign in: #{authenticate_user_path(@user, access_token: @user.access_token)}") # TODO: Create authenticate path
        format.html { redirect_to games_url, notice: 'Sign in using the link sent to you via text.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    Game.where(game_master: @user).destroy_all
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def authenticate
    user = User.find_by(id: params[:id])
    session[:user_id] = params[:id]
    if user.nil?
      redirect_to users_path && return
    elsif params[:access_token] = user.access_token
      user.regenerate_access_token
      user.save
      session[:access_token] = user.access_token
    else
      session[:user_id] = nil
    end
    redirect_to games_url, notice: 'Signed in successfully.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def authorise
      flash[:notice] = "Valid: @user is nil"
      return unless @user
      valid = session[:access_token] == @user.access_token
      flash[:notice] = "Valid: #{valid}"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:phone_number, :nickname)
    end
end
