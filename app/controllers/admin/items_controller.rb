class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).reverse_order.per(10)
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end
end
