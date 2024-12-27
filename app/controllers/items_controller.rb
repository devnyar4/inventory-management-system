class ItemsController < ApplicationController
  before_action :require_login
  before_action :set_item, only: [:edit, :update]
  
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

  def update
    if item_params.values.any?(&:blank?)
      flash.now[:alert] = "入力値が空です。"
      render "update"
    elsif @item.update(item_params)
      redirect_to items_path
    else
      flash.now[:alert] = "アイテムの更新に失敗しました。"
      render "update"
    end
  end

  private

  def set_item
    @item = Item.find_by(id: params[:id])
    if @item.nil?
      redirect_back fallback_location: items_path
    end
  end
  

  def item_params
    params.require(:item).permit(:item_name, :inventory_quantity)
  end
end
  