class ItemsController < ApplicationController
  before_action :set_genres

  def index
    @keyword = params[:keyword]

    @items = if @keyword.present?
      RWS::Ichiba::Item.
        search(keyword: params[:keyword], imageFlag: 1).first(10)
    else
      []
    end
  end

  private
  def set_genres
    @genre = RakutenWebService::Ichiba::Genre.root
  end
end
