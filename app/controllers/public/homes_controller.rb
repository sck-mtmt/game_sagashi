class Public::HomesController < ApplicationController
  def top
    @url = request.url
  end


end
