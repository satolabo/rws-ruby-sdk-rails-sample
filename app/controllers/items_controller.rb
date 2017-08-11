# frozen_string_literal: true
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
    @genre = if params[:genre_id]
      RakutenWebService::Ichiba::Genre.new(params[:genre_id])
    else
      RakutenWebService::Ichiba::Genre.root
    end
  end
end
