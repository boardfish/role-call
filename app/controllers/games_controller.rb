# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy join]
  before_action :authenticate

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show; end

  # GET /games/new
  def new
    @game = Game.new(game_master: User.find_by(access_token: session[:access_token]))
  end

  # GET /games/1/edit
  def edit; end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join
    @user = User.find_by(id: session[:user_id])
    @game_session = GameSession.new(
      user: @user,
      game: @game,
      role: set_role
    )
    TwilioService.send_sms(@user.phone_number, "You've joined #{@game.game_master.nickname}'s game! Welcome, #{@user.nickname}!")
    unless @game_session.save
      redirect_to users_path, notice: 'You must sign in first.'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def game_params
    params.require(:game).permit(:user_id, :game_master_id)
  end

  def authenticate
    flash[:notice] = 'Valid: @game is nil'
    return unless @game

    valid = session[:access_token] = @game.game_master&.access_token
    flash[:notice] = "Valid: #{valid}"
  end

  def set_role
    @game.random_role
  end
end
