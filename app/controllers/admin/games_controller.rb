class Admin::GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.save
    redirect_to admin_games_path(@game.id)
  end

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    redirect_to admin_game_path(@game.id)
  end

  private
    def game_params
      params.require(:game).permit(:game_title, :game_description, :price,
                                   :game_model, :capacity, :is_active)
    end
end

