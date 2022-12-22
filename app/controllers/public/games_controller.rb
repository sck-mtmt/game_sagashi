class Public::GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @review = Review.new
  end
private
  def game_params
    params.require(:game).permit(:game_title, :game_description,
                                 :price, :game_model, :capacity)
  end

end
