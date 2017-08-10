class ItemsController < ApplicationController
  before_action :set_genres

  def index
    @keyword = params[:keyword]

    @items = if @keyword.present?
      RWS::Ichiba::Item.
        search(keyword: params[:keyword], genre_id: @genre.id, imageFlag: 1).first(10)
    else
      []
    end
  end

  private
  def set_genres
    if genre_id = params[:genre_id]
      @genre = RakutenWebService::Ichiba::Genre.new(genre_id)
    else
      @genre = RakutenWebService::Ichiba::Genre.root
    end
  end
end
