class Admin::GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(@game_params)
    @game.save
    redirect_to admin_games_path(@game.id)
  end

  def index
   @games=Game.all
  end

  def show
  end

  def edit
  end

  def update
  end
  private
    def game_params
      params.require(:game).permit(:game_title,:game_description,:price,
                                   :game_model,:capacity,:review_count)
    end
end

