class ItemsController < ApplicationController
  def index
    @items = if params[:keyword].present?
       RWS::Ichiba::Item.
        search(keyword: params[:keyword], imageFlag: 1).first(10)
    else
      []
    end
  end
end
