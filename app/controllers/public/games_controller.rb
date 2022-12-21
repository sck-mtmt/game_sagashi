class Public::GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def search
    #空の配列
    @games = []
    @title = params[:game_title]
    if @title.present?
      #この部分でresultsに楽天APIから取得したデータ（jsonデータ）を格納。
      #ゲームのタイトルを検索して、一致するデータを格納するように設定。
      results = RakutenWebService::Books::Game.search({
        title: @title,
      })
      #この部分で「@games」にAPIからの取得したJSONデータを格納。
      #read(result)については、privateメソッドとして、設定。
      results.each do |result|
        game = Game.new(read(result))
        @games << game
      end
    end
    #「@games」内の各データをそれぞれ保存。
    #すでに保存済の本は除外するためにunlessの構文。
    @games.each do |book|
      unless Game.all.include?(book)
        book.save
      end
    end
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
    #「楽天APIのデータから必要なデータを絞り込む」、且つ「対応するカラムにデータを格納する」メソッドを設定していきます。
  def read(result)
    game_title = result["title"]
    game_description = result["itemCaption"]
    price = result["itemPrice"]
    game_model = result["hardware"]
    rakuten_url = result["itemUrl"]
    isbn = result["isbn"]
    large_image_url = result["largeImageUrl"].gsub('?_ex=120x120', '')
    small_image_url = result["smallImageUrl"].gsub('?_ex=64x64', '')
    {
      game_title: game_title,
      game_description: game_description,
      price: price,
      game_model: game_model
      rakuten_url: rakuten_url,
      large_image_url: large_image_url,
      small_image_url: small_image_url
    }
  end
end
