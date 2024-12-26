class ItemsController < ApplicationController
  before_action :require_login
  
  def index
    @items = Item.all
    render "list"
  end

  def new
    @item = Item.new
    render "register"
  end

  def edit
    render "update"
  end

  def create
    @item = Item.new(item_params)
  
    if item_params.values.any?(&:blank?)
      flash.now[:alert] = "入力値が空です。"
      render "register"
    elsif @item.save
      redirect_to items_path
    else
      flash.now[:alert] = "アイテムの登録に失敗しました。"
      render "register"
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :inventory_quantity)
  end
end
  