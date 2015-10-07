class ItemsController < ApplicationController
  def index
    @items = RWS::Ichiba::Item.
      search(keyword: params[:keyword], imageFlag: 1).first(10)
  end
end
