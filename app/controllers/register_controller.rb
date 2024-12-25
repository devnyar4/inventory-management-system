class RegisterController < ApplicationController
  before_action :require_login
  def index
    @item = Item.new
    render("register/register")
  end

  def register
    @item = Item.new(item_params)
  
    if item_params.values.any?(&:blank?)
      redirect_to register_path, notice: "入力値が空です。"
    elsif @item.save
      redirect_to list_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :inventory_quantity)
  end
end